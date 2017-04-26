class CafDocumentsController < ApplicationController
  before_filter :set_caf_document, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @caf_documents = CafDocument.all
    respond_with(@caf_documents)
  end

  def show
    respond_with(@caf_document)
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

  private
    def set_caf_document
      @caf_document = CafDocument.find(params[:id])
    end
end
