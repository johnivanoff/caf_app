class HqPositionsController < ApplicationController
  before_filter :set_hq_position, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @hq_positions = HqPosition.all
    respond_with(@hq_positions)
  end

  def show
    respond_with(@hq_position)
  end

  def new
    @hq_position = HqPosition.new
    respond_with(@hq_position)
  end

  def edit
  end

  def create
    @hq_position = HqPosition.new(params[:hq_position])
    @hq_position.save
    respond_with(@hq_position)
  end

  def update
    @hq_position.update_attributes(params[:hq_position])
    respond_with(@hq_position)
  end

  def destroy
    @hq_position.destroy
    respond_with(@hq_position)
  end

  private
    def set_hq_position
      @hq_position = HqPosition.find(params[:id])
    end
end
