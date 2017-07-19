class ContentCategoriesController < ApplicationController
  before_filter :set_content_category, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @content_categories = ContentCategory.all
    respond_with(@content_categories)
  end

  def show
    respond_with(@content_category)
  end

  def new
    @content_category = ContentCategory.new
    respond_with(@content_category)
  end

  def edit
  end

  def create
    @content_category = ContentCategory.new(params[:content_category])
    @content_category.save
    respond_with(@content_category)
  end

  def update
    @content_category.update_attributes(params[:content_category])
    respond_with(@content_category)
  end

  def destroy
    @content_category.destroy
    respond_with(@content_category)
  end

  private
    def set_content_category
      @content_category = ContentCategory.find(params[:id])
    end
end
