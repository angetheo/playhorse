class EventsController < ApplicationController

	include Admin::AdminHelper

  def index
  	@events = Event.all.sort_by(&:created_at).reverse
    @communication = Communication.where(comm_type: 'eventi').first
  end

  def show
  	@event = Event.find(params[:id])

  	respond_to do |format|
      format.json { render json: @event }
    end
  end

  def create
    program = params[:file_program].nil? ? "" : upload(params[:file_program].original_filename, params[:file_program].tempfile)
    hours = params[:file_hours].nil? ? "" : upload(params[:file_hours].original_filename, params[:file_hours].tempfile)
    announcement = params[:file_announcement].nil? ? "" : upload(params[:file_announcement].original_filename, params[:file_announcement].tempfile)
    result = params[:file_result].nil? ? "" : upload(params[:file_result].original_filename, params[:file_result].tempfile)

    @event = Event.create({
      date: params[:event_date],
      name: params[:event_name],
      program: program,
      hours: hours,
      announcement: announcement,
      result: result
    })

    redirect_to(:back)
  end

  def update
  	@event = Event.find(params[:id])

  	@event.date = params[:edit_event_date]
  	@event.name = params[:edit_event_name]

  	@event.program = upload(params[:edit_file_program].original_filename, params[:edit_file_program].tempfile) unless params[:edit_file_program].nil?
  	@event.hours = upload(params[:edit_file_hours].original_filename, params[:edit_file_hours].tempfile) unless params[:edit_file_hours].nil?
  	@event.announcement = upload(params[:edit_file_announcement].original_filename, params[:edit_file_announcement].tempfile) unless params[:edit_file_announcement].nil?
  	@event.result = upload(params[:edit_file_result].original_filename, params[:edit_file_result].tempfile) unless params[:edit_file_result].nil?

  	@event.save!
	  redirect_to(:back)
  end

  def destroy
    Event.delete(params[:id])
    redirect_to(:back)
  end
end
