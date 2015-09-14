class Admin::MaresController < ApplicationController

	layout "admin_layout"

	before_filter :authenticate

  def index
  	@mares = Mare.all.sort_by(&:created_at).reverse
  end
end
