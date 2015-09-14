class Admin::MaresController < ApplicationController

	layout "admin_layout"
	include AdminHelper

	before_filter :authenticate

  def index
  	@mares = Mare.all.sort_by(&:created_at).reverse
  end
end
