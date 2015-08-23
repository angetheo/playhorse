class Admin::ArticlesController < ApplicationController

	layout "admin_layout"
	include AdminHelper
	
  def index
  	@articles = Article.all.sort_by(&:created_at).reverse
  end
end
