class AttendancesController < ApplicationController
  before_action :check_event_creator, only: [:index]

  def index
    @event = Event.find(params[:event_id])
    @attendances = @event.attendances
  end

  private

  def check_event_creator
    @event = Event.find(params[:event_id])
  end
end
