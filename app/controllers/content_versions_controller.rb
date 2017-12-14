class ContentVersionsController < ApplicationController

skip_before_filter :check_authentication, :check_authorization

  def revert
    @version = Version.find(params[:id])
    @version.reify.save!
    redirect_to :back, :notice => "Undid #{@version.event}"
  end

#  before_filter :require_user
  before_filter :set_content_and_version, :only => [:diff, :rollback, :destroy]

  def diff
  end

  def rollback
    # change the current document to the specified version
    # reify gives you the object of this version
    content = @version.reify
    content.save
    redirect_to edit_content_path(@content)
  end

  private

    def set_content_and_version
      @content = Content.find(params[:content_id])
      @version = @content.versions.find(params[:id])
    end

end