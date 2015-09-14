class ProductsController < ApplicationController

  include AdminHelper
  
  def index
  end

  def search
  	@results = Product.where(product_type: params[:type], category: params[:category])

  	respond_to do |format|
      format.html { render :partial => 'products/results.html', :results => @results }
    end
  end

  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.json { render json: @product }
    end
  end

  def create
    picture = params[:product_picture].nil? ? "/assets/placeholders/placeholder.png" : upload(params[:product_picture].original_filename, params[:product_picture].tempfile, 'playhorse-products')

    @product = Product.create({
      category: params[:product_category],
      product_type: params[:product_type],
      name: params[:product_name],
      description: params[:product_description],
      picture: picture
    })

    redirect_to(:back)
  end

  def update
    @product = Product.find(params[:id])
    
    @product.category = params[:edit_product_category]
    @product.product_type = params[:edit_product_type]
    @product.name = params[:edit_product_name]
    @product.description = params[:edit_product_description]
    @product.picture = upload(params[:edit_product_picture].original_filename, params[:edit_product_picture].tempfile, 'playhorse-products') unless params[:edit_product_picture].nil? 

    @product.save!
    redirect_to(:back)
  end

  def destroy
    Product.delete(params[:id])
    redirect_to(:back)
  end
end
