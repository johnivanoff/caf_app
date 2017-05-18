class DocumentCategoriesController < ApplicationController
  before_filter :set_document_category, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @document_categories = DocumentCategory.all
    respond_with(@document_categories)
  end

  def show
    respond_with(@document_category)
  end

  def new
    @document_category = DocumentCategory.new
    respond_with(@document_category)
  end

  def edit
  end

  def create
    @document_category = DocumentCategory.new(params[:document_category])
    @document_category.save
    respond_with(@document_category)
  end

  def update
    @document_category.update_attributes(params[:document_category])
    respond_with(@document_category)
  end

  def destroy
    @document_category.destroy
    respond_with(@document_category)
  end

  private
    def set_document_category
      @document_category = DocumentCategory.find(params[:id])
    end
end
