class PositionAssignmentsController < ApplicationController
  before_filter :set_position_assignment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @position_assignments = PositionAssignment.all
    respond_with(@position_assignments)
  end

  def general_staff
    @hq_position_assignments = PositionAssignment.general_staff.all
    respond_with(@position_assignments)
  end

  def headquarters_staff
    @hq_position_assignments = PositionAssignment.hq_staff.all
    respond_with(@position_assignments)
  end

  def show
    respond_with(@position_assignment)
  end

  def new
    @position_assignment = PositionAssignment.new
    respond_with(@position_assignment)
  end

  def edit
  end

  def create
    @position_assignment = PositionAssignment.new(params[:position_assignment])
    @position_assignment.save
    respond_with(@position_assignment)
  end

  def update
    @position_assignment.update_attributes(params[:position_assignment])
    respond_with(@position_assignment)
  end

  def destroy
    @position_assignment.destroy
    respond_with(@position_assignment)
  end

  private
    def set_position_assignment
      @position_assignment = PositionAssignment.find(params[:id])
    end
end
