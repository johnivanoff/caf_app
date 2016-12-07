class AircraftsController < ApplicationController
  before_filter :set_aircraft, only: [:show, :edit, :update, :destroy]

  skip_before_filter :check_authorization, :check_authentication, :only => [:index, :show]

  respond_to :html

  def index
    @aircrafts = Aircraft.all
    respond_with(@aircrafts)
  end

  def show
    respond_with(@aircraft)
  end

  def new
    @aircraft = Aircraft.new
    respond_with(@aircraft)
  end

  def edit
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
