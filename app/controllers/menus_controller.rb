class MenusController < ApplicationController
  before_filter :set_menu, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @menus = Menu.order("position").all
    respond_with(@menus)
  end

  def show
    respond_with(@menu)
  end

  def new
    @menu = Menu.new
    respond_with(@menu)
  end

  def edit
  end

  def create
    @menu = Menu.new(params[:menu])
    @menu.save
    respond_with(@menu)
  end

  def update
    @menu.update_attributes(params[:menu])
    respond_with(@menu)
  end

  def destroy
    @menu.destroy
    respond_with(@menu)
  end

  def sort
    params[:menu].each_with_index do |id, index|
      Menu.update_all({:position => index+1}, {:id => id})
    end

    render :nothing => true 
  end

  private
    def set_menu
      @menu = Menu.find(params[:id])
    end
end
