class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  def index
    # @schedules = Schedule.where(service: current_user.services)
    @schedules = Schedule.all
  end

  def show
  end

  private
  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit( :date,
                                :uploaded,
                                :service_id,
                                :spreadsheet
                               )
  end
end
