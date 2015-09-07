class MaresController < ApplicationController

	include AdminHelper

  def index
  	@mares = Mare.all.sort_by(&:created_at).reverse
  end

  def show
  	@mare = Mare.find(params[:id])

  	respond_to do |format|
      format.json { render json: @mare }
    end
  end

  def create
    picture = params[:mare_image].nil? ? "" : upload(params[:mare_image].original_filename, params[:mare_image].tempfile, 'playhorse-mares')

    Mare.create({
      name: params[:mare_name],
      description: params[:mare_description],
      image: picture
    })

    redirect_to(:back)
  end

  def update
  	@mare = Mare.find(params[:id])

  	@mare.name = params[:edit_mare_name]
  	@mare.description = params[:edit_mare_description]
  	@mare.image = upload(params[:edit_mare_image].original_filename, params[:edit_mare_image].tempfile, 'playhorse-mares') unless params[:edit_mare_image].nil?

  	@mare.save!
	  redirect_to(:back)
  end

  def destroy
    Mare.delete(params[:id])
    redirect_to(:back)
  end
end
