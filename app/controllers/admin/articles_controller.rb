class Admin::ArticlesController < ApplicationController

	layout "admin_layout"
	include AdminHelper

	before_filter :authenticate
	
  def index
  	@articles = Article.all.sort_by(&:created_at).reverse
  end
end
