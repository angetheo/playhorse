class Admin::EventsController < ApplicationController

	layout "admin_layout"

	before_filter :authenticate

  def index
  	@events = Event.all.sort_by(&:created_at).reverse
  	@communication = Communication.where(comm_type: 'eventi').first
  end
end
