class Admin::StaffController < ApplicationController

	layout "admin_layout"
	include AdminHelper

	before_filter :authenticate
	
  def index
  	@staff = Staff.all.sort_by(&:order)
  end
end
