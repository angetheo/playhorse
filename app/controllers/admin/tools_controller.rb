class Admin::ToolsController < ApplicationController

	layout "admin_layout"
	before_filter :authenticate

  def index
  end
end
