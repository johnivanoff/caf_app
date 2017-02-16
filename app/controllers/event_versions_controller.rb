class EventVersionsController < ApplicationController

skip_before_filter :check_authentication, :check_authorization

  def revert
    @version = Version.find(params[:id])
    @version.reify.save!
    redirect_to :back, :notice => "Undid #{@version.event}"
  end

#  before_filter :require_user
  before_filter :set_event_and_version, :only => [:diff, :rollback, :destroy]

  def diff
  end

  def rollback
    # change the current document to the specified version
    # reify gives you the object of this version
    event = @version.reify
    event.save
    redirect_to edit_event_path(@event)
  end

  private

    def set_event_and_version
      @event = Event.find(params[:event_id])
      @version = @event.versions.find(params[:id])
    end

end
