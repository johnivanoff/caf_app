class AircraftVersionsController < ApplicationController

skip_before_filter :check_authentication, :check_authorization

  def revert
    @version = Version.find(params[:id])
    @version.reify.save!
    redirect_to :back, :notice => "Undid #{@version.event}"
  end

#  before_filter :require_user
  before_filter :set_aircraft_and_version, :only => [:diff, :rollback, :destroy]

  def diff
  end

  def rollback
    # change the current document to the specified version
    # reify gives you the object of this version
    aircraft = @version.reify
    aircraft.save
    redirect_to edit_aircraft_path(@aircraft)
  end

  private

    def set_aircraft_and_version
      @aircraft = Aircraft.find(params[:aircraft_id])
      @version = @aircraft.versions.find(params[:id])
    end

end