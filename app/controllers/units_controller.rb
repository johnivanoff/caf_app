class UnitsController < ApplicationController
  before_filter :set_unit, only: [:show, :edit, :update, :destroy]

skip_before_filter :check_authorization, :check_authentication, :only => [:index, :show]

  respond_to :html

  class NotActivated < StandardError
  end

  rescue_from NotActivated, :with => :not_activated

  def not_activated(exception)
    flash[:notice] = "You do not have permission to edit this Unit."
 #   Event.new_event "Exception: #{exception.message}", current_user, request.remote_ip
    redirect_to @unit
  end


  def index
    @units = Unit.alpha_order.all
    respond_with(@units)
  end

  def unit_admin
    @units = Unit.alpha_order.all
    respond_with(@units)
  end

  def show
    respond_with(@unit,
    @all_units = Unit.alpha_order.all)
  end

  def new
    @unit = Unit.new

    social_links = @unit.social_links.build
     
    respond_with(@unit)
  end

  def edit

		raise NotActivated unless current_user.roles.any? {|role| role.name == "superuser" or role.name == "admin" or ((role.name == "unit admin") && (current_user.member.units.any? {|unit| unit == @unit}))}

  end

  def create
    @unit = Unit.new(params[:unit])
    @unit.save
    respond_with(@unit)
  end

  def update
    @unit.update_attributes(params[:unit])
    respond_with(@unit)
  end

  def destroy
    @unit.destroy
    respond_with(@unit)
  end

  private
    def set_unit
      @unit = Unit.find(params[:id])
    end
end
