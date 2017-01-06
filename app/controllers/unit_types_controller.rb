class UnitTypesController < ApplicationController
  before_filter :set_unit_type, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @unit_types = UnitType.all
    respond_with(@unit_types)
  end

  def show
    respond_with(@unit_type)
  end

  def new
    @unit_type = UnitType.new
    respond_with(@unit_type)
  end

  def edit
  end

  def create
    @unit_type = UnitType.new(params[:unit_type])
    @unit_type.save
    respond_with(@unit_type)
  end

  def update
    @unit_type.update_attributes(params[:unit_type])
    respond_with(@unit_type)
  end

  def destroy
    @unit_type.destroy
    respond_with(@unit_type)
  end

  private
    def set_unit_type
      @unit_type = UnitType.find(params[:id])
    end
end
