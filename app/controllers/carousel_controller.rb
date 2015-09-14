class CarouselController < ApplicationController

  include Admin::AdminHelper

  def show
    @carousel = Carousel.find(params[:id])

  	respond_to do |format|
      format.json { render json: @carousel }
    end
  end

  def update
    @carousel = Carousel.find(params[:id])

  	@carousel.title = params[:edit_carousel_title]
	  @carousel.subtitle = params[:edit_carousel_subtitle]
	  @carousel.button = params[:edit_carousel_button]
	  @carousel.button_url = params[:edit_carousel_button_url]
	  @carousel.image = upload(params[:edit_carousel_image].original_filename, params[:edit_carousel_image].tempfile) unless params[:edit_carousel_image].nil?
    @carousel.save!
	  redirect_to(:back)
  end
end
