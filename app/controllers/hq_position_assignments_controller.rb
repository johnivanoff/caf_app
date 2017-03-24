class HqPositionAssignmentsController < ApplicationController
  before_filter :set_hq_position_assignment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @hq_position_assignments = HqPositionAssignment.all
    respond_with(@hq_position_assignments)
  end

  def hq_position_admin
    @hq_position_assignments = HqPositionAssignment.all
    respond_with(@hq_position_assignments)
  end

  def show
    respond_with(@hq_position_assignment)
  end

  def new
    @hq_position_assignment = HqPositionAssignment.new
    respond_with(@hq_position_assignment)
  end

  def edit
  end

  def create
    @hq_position_assignment = HqPositionAssignment.new(params[:hq_position_assignment])
    @hq_position_assignment.save
    respond_with(@hq_position_assignment)
  end

  def update
    @hq_position_assignment.update_attributes(params[:hq_position_assignment])
    respond_with(@hq_position_assignment)
  end

  def destroy
    @hq_position_assignment.destroy
    respond_with(@hq_position_assignment)
  end

  private
    def set_hq_position_assignment
      @hq_position_assignment = HqPositionAssignment.find(params[:id])
    end
end
