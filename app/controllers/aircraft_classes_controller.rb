class AircraftClassesController < ApplicationController
  before_filter :set_aircraft_class, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @aircraft_classes = AircraftClass.all
    respond_with(@aircraft_classes)
  end

  def show
    respond_with(@aircraft_class)
  end

  def new
    @aircraft_class = AircraftClass.new
    respond_with(@aircraft_class)
  end

  def edit
  end

  def create
    @aircraft_class = AircraftClass.new(params[:aircraft_class])
    @aircraft_class.save
    respond_with(@aircraft_class)
  end

  def update
    @aircraft_class.update_attributes(params[:aircraft_class])
    respond_with(@aircraft_class)
  end

  def destroy
    @aircraft_class.destroy
    respond_with(@aircraft_class)
  end

  private
    def set_aircraft_class
      @aircraft_class = AircraftClass.find(params[:id])
    end
end
