class UnitVersionsController < ApplicationController

skip_before_filter :check_authentication, :check_authorization

  def revert
    @version = Version.find(params[:id])
    @version.reify.save!
    redirect_to :back, :notice => "Undid #{@version.event}"
  end

#  before_filter :require_user
  before_filter :set_unit_and_version, :only => [:diff, :rollback, :destroy]

  def diff
  end

  def rollback
    # change the current document to the specified version
    # reify gives you the object of this version
    unit = @version.reify
    unit.save
    redirect_to edit_unit_path(@unit)
  end

  private

    def set_unit_and_version
      @unit = Unit.find(params[:unit_id])
      @version = @unit.versions.find(params[:id])
    end

end