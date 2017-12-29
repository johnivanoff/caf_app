class MembersController < ApplicationController
  before_filter :set_member, only: [:show, :edit, :update, :destroy]

#skip_before_filter :check_authorization, :check_authentication, :only => [:index]


  respond_to :html

  def index
    @members = Member.all
    respond_with(@members)
  end

  def hq_directory
    @hq_positions = HqPosition.all
    
  end

  def show
    respond_with(@member)
  end

  def new
    @member = Member.new
    user = @member.build_user
    @roles = Role.find(:all)
    @units = Unit.alpha_order.find(:all)
    @hq_positions = HqPosition.alpha_order.find(:all)
    respond_with(@member)
  end

  def edit
    @roles = Role.find(:all)
    @units = Unit.alpha_order.find(:all)
    @hq_positions = HqPosition.alpha_order.find(:all)
  end

  def create
    @member = Member.new(params[:member])
    @roles = Role.find(:all)
    @units = Unit.alpha_order.find(:all)
    @hq_positions = HqPosition.alpha_order.find(:all)

    checked_roles = []
    checked_params = params[:role_list] || []
    for check_box_id in checked_params
      role = Role.find(check_box_id)
      if not @member.user.roles.include?(role)
        @member.user.roles << role
      end
      checked_roles << role
    end

    checked_units = []
    checked_params_2 = params[:unit_list] || []
    for check_box_id in checked_params_2
      unit = Unit.find(check_box_id)
      if not @member.units.include?(unit)
        @member.units << unit
      end
      checked_units << unit
    end

    checked_positions = []
    checked_params_3 = params[:position_list] || []
    for check_box_id in checked_params_3
      position = HqPosition.find(check_box_id)
      if not @member.hq_positions.include?(position)
        @member.hq_positions << position
      end
      checked_positions << position
    end
    
    @member.save
    respond_with(@member)
  end

  def update
    @member.update_attributes(params[:member])
    @roles = Role.find(:all)
    @units = Unit.alpha_order.find(:all)
    @hq_positions = HqPosition.alpha_order.find(:all)

    if params[:commit] == "Update Member"
      checked_roles = []
      checked_params = params[:role_list] || []
      for role_check_box_id in checked_params
        role = Role.find(role_check_box_id)
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

      checked_units = []
      checked_params_2 = params[:unit_list] || []
      for check_box_id in checked_params_2
        unit = Unit.find(check_box_id)
        if not @member.units.include?(unit)
          @member.units << unit
        end
        checked_units << unit
      end
      missing_units = @units - checked_units
      for unit in missing_units
        if @member.units.include?(unit)
          @member.units.delete(unit)
        end
      end

      checked_positions = []
      checked_params_3 = params[:position_list] || []
      for check_box_id in checked_params_3
        position = HqPosition.find(check_box_id)
        if not @member.hq_positions.include?(position)
          @member.hq_positions << position
        end
        checked_positions << position
      end
      missing_positions = @hq_positions - checked_positions
      for position in missing_positions
        if @member.hq_positions.include?(position)
          @member.hq_positions.delete(position)
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
