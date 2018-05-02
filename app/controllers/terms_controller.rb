class TermsController < ApplicationController
  before_filter :set_term, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @terms = Term.all
    respond_with(@terms)
  end

  def hall_of_fame
    @hall_of_famers = Term.hof
    respond_with(@hall_of_famers)
  end

  def show
    respond_with(@term)
  end

  def new
    @term = Term.new
    respond_with(@term)
  end

  def edit
  end

  def create
    @term = Term.new(params[:term])
    @term.save
    respond_with(@term)
  end

  def update
    @term.update_attributes(params[:term])
    respond_with(@term)
  end

  def destroy
    @term.destroy
    respond_with(@term)
  end

  private
    def set_term
      @term = Term.find(params[:id])
    end
end
