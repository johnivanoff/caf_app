class RightsController < ApplicationController
  before_filter :set_right, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @rights = Right.ordered.all
    respond_with(@rights)
  end

  def show
    respond_with(@right)
  end

  def new
    @right = Right.new
    respond_with(@right)
  end

  def edit
  end

  def create
    @right = Right.new(params[:right])
    @right.save
    respond_with(@right)
  end

  def update
    @right.update_attributes(params[:right])
    respond_with(@right)
  end

  def destroy
    @right.destroy
    respond_with(@right)
  end

  private
    def set_right
      @right = Right.find(params[:id])
    end
end
