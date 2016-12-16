class UnitAssignmentsController < ApplicationController
  before_filter :set_unit_assignment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @unit_assignments = UnitAssignment.all
    respond_with(@unit_assignments)
  end

  def show
    respond_with(@unit_assignment)
  end

  def new
    @unit_assignment = UnitAssignment.new
    respond_with(@unit_assignment)
  end

  def edit
  end

  def create
    @unit_assignment = UnitAssignment.new(params[:unit_assignment])
    @unit_assignment.save
    respond_with(@unit_assignment)
  end

  def update
    @unit_assignment.update_attributes(params[:unit_assignment])
    respond_with(@unit_assignment)
  end

  def destroy
    @unit_assignment.destroy
    respond_with(@unit_assignment)
  end

  private
    def set_unit_assignment
      @unit_assignment = UnitAssignment.find(params[:id])
    end
end
