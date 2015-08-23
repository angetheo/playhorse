class ServiceController < ApplicationController
  def show
  	@service = Service.find(params[:id])

  	respond_to do |format|
      format.json { render json: @service }
    end
  end

  def update
  	@service = Service.find(params[:id])

  	@service.title = params[:edit_service_title]
  	@service.description = params[:edit_service_description]
  	@service.save

  	respond_to do |format|
  		format.json { render json: @service }
  	end
  end
end
