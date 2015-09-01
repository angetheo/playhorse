class FaqController < ApplicationController
  def index
  	@faqs = Faq.all
  	@top_faqs = @faqs.sort_by(&:views).reverse.first(5)
  	@faq_categories = Faq.pluck('DISTINCT category')
  end

  def show
  	@faq = Faq.find(params[:id])

  	respond_to do |format|
      format.json { render json: @faq }
    end
  end

  def create
  	Faq.create({
  		category: params[:faq_category],
  		question: params[:faq_question],
  		answer: params[:faq_answer],
  		views: 0
  	})

  	redirect_to(:back)
  end

  def update
    @faq = Faq.find(params[:id])

    @faq.category = params[:edit_faq_category]
    @faq.question = params[:edit_faq_question]
    @faq.answer = params[:edit_faq_answer]

    @faq.save
    redirect_to(:back)
  end

  def destroy
  	Faq.delete(params[:id])
    redirect_to(:back)
  end
end
