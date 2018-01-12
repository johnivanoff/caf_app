class DocumentFilesController < ApplicationController
  before_filter :set_document_file, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @document_files = DocumentFile.all
    respond_with(@document_files)
  end

  def show
    respond_with(@document_file)
  end

  def new
    @document_file = DocumentFile.new
    respond_with(@document_file)
  end

  def edit
  end

  def create
    @document_file = DocumentFile.new(params[:document_file])
    @document_file.save
    respond_with(@document_file)
  end

  def update
    @document_file.update_attributes(params[:document_file])
    respond_with(@document_file)
  end

  def destroy
    @document_file.destroy
    respond_with(@document_file)
  end

  private
    def set_document_file
      @document_file = DocumentFile.find(params[:id])
    end
end
