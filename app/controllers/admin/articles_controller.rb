class Admin::ArticlesController < ApplicationController

	layout "admin_layout"

	before_filter :authenticate
	
  def index
  	@articles = Article.all.sort_by(&:created_at).reverse
  end
end
