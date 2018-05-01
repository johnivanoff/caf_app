class AircraftController < ApplicationController
  before_filter :set_aircraft, only: [:show, :edit, :update, :destroy]

  skip_before_filter :check_authorization, :check_authentication, :only => [:aircraft_rides, :index, :show, :aircraft_admin, ]

  respond_to :html

  class NotActivated < StandardError
  end

  rescue_from NotActivated, :with => :not_activated

  def not_activated(exception)
    flash[:notice] = "You do not have permission to edit this Aircraft."
 #   Event.new_event "Exception: #{exception.message}", current_user, request.remote_ip
    redirect_to @aircraft
  end


  def index
    @aircrafts = Aircraft.all
    @aircraft_classes = AircraftClass.all
#    @bombers = Aircraft.bomber.all
    respond_with(@aircrafts)
  end

  def aircraft_rides
    @ride_aircraft = Aircraft.rides
    @rides_copy = Content.aircraft_rides_copy
    respond_with(@ride_aircraft)
  end

  def aircraft_admin
    @aircrafts = Aircraft.all
    @aircraft_classes = AircraftClass.all
#    @bombers = Aircraft.bomber.all
    respond_with(@aircrafts)
  end

  def show
    respond_with(@aircraft,
    @all_aircraft = Aircraft.all)
  end

  def new
    @aircraft = Aircraft.new
    respond_with(@aircraft)
  end

  def edit
  
		raise NotActivated unless current_user.roles.any? {|role| role.name == "superuser" or role.name == "admin" or ((role.name == "unit admin") && (current_user.member.units.any? {|unit| unit == @aircraft.unit}))}

  end

  def create
    @aircraft = Aircraft.new(params[:aircraft])
    @aircraft.save
    respond_with(@aircraft)
  end

  def update
    @aircraft.update_attributes(params[:aircraft])
    respond_with(@aircraft)
  end

  def destroy
    @aircraft.destroy
    respond_with(@aircraft)
  end

  private
    def set_aircraft
      @aircraft = Aircraft.find(params[:id])
    end
end
