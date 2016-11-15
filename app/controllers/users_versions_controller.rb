class UsersVersionsController < ApplicationController

skip_before_filter :check_authentication, :check_authorization

  def revert
    @version = Version.find(params[:id])
    @version.reify.save!
    redirect_to :back, :notice => "Undid #{@version.event}"
  end

#  before_filter :require_user
  before_filter :set_user_and_version, :only => [:diff, :rollback, :destroy]

  def diff
  end

  def rollback
    # change the current document to the specified version
    # reify gives you the object of this version
    user = @version.reify
    user.save
    redirect_to edit_user_path(@user)
  end

  private

    def set_user_and_version
      @user = User.find(params[:user_id])
      @version = @user.versions.find(params[:id])
    end

end