class Admin::StaffController < ApplicationController

	layout "admin_layout"
	include AdminHelper
	
  def index
  	@staff = Staff.all.sort_by(&:order)
  end
end
