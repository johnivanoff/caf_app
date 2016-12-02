class MenuVersionsController < ApplicationController

skip_before_filter :check_authentication, :check_authorization

  def revert
    @version = Version.find(params[:id])
    @version.reify.save!
    redirect_to :back, :notice => "Undid #{@version.event}"
  end

#  before_filter :require_user
  before_filter :set_menu_and_version, :only => [:diff, :rollback, :destroy]

  def diff
  end

  def rollback
    # change the current document to the specified version
    # reify gives you the object of this version
    menu = @version.reify
    menu.save
    redirect_to edit_menu_path(@menu)
  end

  private

    def set_menu_and_version
      @menu = Menu.find(params[:menu_id])
      @version = @menu.versions.find(params[:id])
    end

end