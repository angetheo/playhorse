class Admin::ToolsController < ApplicationController

	include AdminHelper
	layout "admin_layout"

	before_filter :authenticate

  def index
  end
end
