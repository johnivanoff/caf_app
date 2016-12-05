class UnitsController < ApplicationController
  before_filter :set_unit, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @units = Unit.alpha_order.all
    respond_with(@units)
  end

  def show
    respond_with(@unit)
  end

  def new
    @unit = Unit.new
    respond_with(@unit)
  end

  def edit
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
