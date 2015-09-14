class Admin::StaffController < ApplicationController

	layout "admin_layout"

	before_filter :authenticate
	
  def index
  	@staff = Staff.all.sort_by(&:order)
  end
end
