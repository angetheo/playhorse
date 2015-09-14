class Admin::FaqController < ApplicationController
  
	layout "admin_layout"

  before_filter :authenticate

  def index
  	@faqs = Faq.all
  	@categorized_faqs = Array.new
  	categories = Faq.pluck('DISTINCT category')
  	categories.each do |category|
  		@categorized_faqs << @faqs.where(category: category).sort_by(&:created_at).reverse
  	end
  end
end
