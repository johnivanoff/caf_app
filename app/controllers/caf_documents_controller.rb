class CafDocumentsController < ApplicationController
  before_filter :set_caf_document, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @caf_documents = CafDocument.category_ordered.order("position").all
    respond_with(@caf_documents)
  end

  def show
    respond_with(@caf_document, @all_caf_documents = CafDocument.all)
  end

  def new
    @caf_document = CafDocument.new
    respond_with(@caf_document)
  end

  def edit
  end

  def create
    @caf_document = CafDocument.new(params[:caf_document])
    @caf_document.save
    respond_with(@caf_document)
  end

  def update
    @caf_document.update_attributes(params[:caf_document])
    respond_with(@caf_document)
  end

  def destroy
    @caf_document.destroy
    respond_with(@caf_document)
  end

  def sort
    params[:caf_document].each_with_index do |id, index|
      CafDocument.update_all({:position => index+1}, {:id => id})
    end

    render :nothing => true 
  end

  private
    def set_caf_document
      @caf_document = CafDocument.find(params[:id])
    end
end
