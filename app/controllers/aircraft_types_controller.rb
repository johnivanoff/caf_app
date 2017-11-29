class AircraftTypesController < ApplicationController
  before_filter :set_aircraft_type, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @aircraft_types = AircraftType.all
    respond_with(@aircraft_types)
  end

  def show
    respond_with(@aircraft_type)
  end

  def new
    @aircraft_type = AircraftType.new
    @aircraft_classes = AircraftClass.find(:all)
    respond_with(@aircraft_type)
  end

  def edit
    @aircraft_classes = AircraftClass.find(:all)
  end

  def create
    @aircraft_type = AircraftType.new(params[:aircraft_type])
    @aircraft_type.save
    respond_with(@aircraft_type)
  end

  def update
    @aircraft_type.update_attributes(params[:aircraft_type])
    @aircraft_classes = AircraftClass.find(:all)

#   <label><%= check_box_tag('aircraft_class_list[]', aircraft_class.id, @aircraft_type.aircraft_classes.collect {|obj| obj.id}.include?(aircraft_class.id)) %><%= aircraft_class.class_type %></label><br />


      checked_aircraft_classes = []
      checked_params = params[:aircraft_class_list] || []
      for check_box_id in checked_params
        aircraft_class = AircraftClass.find(check_box_id)
        if not @aircraft_type.aircraft_classes.include?(aircraft_class)
          @aircraft_type.aircraft_classes << aircraft_class
        end
        checked_aircraft_classes << aircraft_class
      end
      missing_aircraft_classes = @aircraft_classes - checked_aircraft_classes
      for aircraft_class in missing_aircraft_classes
        if @aircraft_type.aircraft_classes.include?(aircraft_class)
          @aircraft_type.aircraft_classes.delete(aircraft_class)
        end
      end

    respond_with(@aircraft_type)
  end

  def destroy
    @aircraft_type.destroy
    respond_with(@aircraft_type)
  end

  private
    def set_aircraft_type
      @aircraft_type = AircraftType.find(params[:id])
    end
end
