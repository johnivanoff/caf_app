class ContentGalleriesController < ApplicationController
  before_filter :set_content_gallery, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @content_galleries = ContentGallery.all
    respond_with(@content_galleries)
  end

  def show
    respond_with(@content_gallery)
  end

  def new
    @content_gallery = ContentGallery.new
    respond_with(@content_gallery)
  end

  def edit
  end

  def create
    @content_gallery = ContentGallery.new(params[:content_gallery])
    @content_gallery.save
    respond_with(@content_gallery)
  end

  def update
    @content_gallery.update_attributes(params[:content_gallery])
    respond_with(@content_gallery)
  end

  def destroy
    @content_gallery.destroy
    respond_with(@content_gallery)
  end

  private
    def set_content_gallery
      @content_gallery = ContentGallery.find(params[:id])
    end
end
