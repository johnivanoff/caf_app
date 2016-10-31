class GrantsController < ApplicationController
  before_filter :set_grant, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @grants = Grant.all
    respond_with(@grants)
  end

  def show
    respond_with(@grant)
  end

  def new
    @grant = Grant.new
    respond_with(@grant)
  end

  def edit
  end

  def create
    @grant = Grant.new(params[:grant])
    @grant.save
    respond_with(@grant)
  end

  def update
    @grant.update_attributes(params[:grant])
    respond_with(@grant)
  end

  def destroy
    @grant.destroy
    respond_with(@grant)
  end

  private
    def set_grant
      @grant = Grant.find(params[:id])
    end
end
