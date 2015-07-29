class FaqController < ApplicationController
  def index
  	@faqs = Faq.all
  	@top_faqs = @faqs.sort_by(&:views).reverse.first(5)
  	@faq_categories = Faq.pluck('DISTINCT category')
  end
end
