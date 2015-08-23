class Admin::EventsController < ApplicationController

	layout "admin_layout"
	include AdminHelper

  def index
  	@events = Event.all.sort_by(&:created_at).reverse
  end
end
