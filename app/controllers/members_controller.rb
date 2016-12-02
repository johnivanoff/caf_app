class MembersController < ApplicationController
  before_filter :set_member, only: [:show, :edit, :update, :destroy]

#skip_before_filter :check_authorization, :check_authentication, :only => [:index]


  respond_to :html

  def index
    @members = Member.all
    respond_with(@members)
  end

  def show
    respond_with(@member)
  end

  def new
    @member = Member.new
    user = @member.build_user
    @roles = Role.find(:all)
    respond_with(@member)
  end

  def edit
    @roles = Role.find(:all)
  end

  def create
    @member = Member.new(params[:member])
    @roles = Role.find(:all)

    checked_roles = []
    checked_params = params[:role_list] || []
    for check_box_id in checked_params
      role = Role.find(check_box_id)
      if not @member.user.roles.include?(role)
        @member.user.roles << role
      end
      checked_roles << role
    end
    
    @member.save
    respond_with(@member)
  end

  def update
    @member.update_attributes(params[:member])
    @roles = Role.find(:all)
    
    if params[:commit] == "Update Member"
      checked_roles = []
      checked_params = params[:role_list] || []
      for check_box_id in checked_params
        role = Role.find(check_box_id)
        if not @member.user.roles.include?(role)
          @member.user.roles << role
        end
        checked_roles << role
      end
      missing_roles = @roles - checked_roles
      for role in missing_roles
        if @member.user.roles.include?(role)
          @member.user.roles.delete(role)
        end
      end
    end
    
    respond_with(@member)
  end

  def destroy
    @member.destroy
    respond_with(@member)
  end

  private
    def set_member
      @member = Member.find(params[:id])
    end
end
