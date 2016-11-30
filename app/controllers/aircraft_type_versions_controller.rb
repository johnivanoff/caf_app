class AircraftTypeVersionsController < ApplicationController

skip_before_filter :check_authentication, :check_authorization

  def revert
    @version = Version.find(params[:id])
    @version.reify.save!
    redirect_to :back, :notice => "Undid #{@version.event}"
  end

#  before_filter :require_user
  before_filter :set_aircraft_type_and_version, :only => [:diff, :rollback, :destroy]

  def diff
  end

  def rollback
    # change the current document to the specified version
    # reify gives you the object of this version
    aircraft_type = @version.reify
    aircraft_type.save
    redirect_to edit_aircraft_type_path(@aircraft_type)
  end

  private

    def set_aircraft_type_and_version
      @aircraft_type = AircraftType.find(params[:aircraft_type_id])
      @version = @aircraft_type.versions.find(params[:id])
    end

end