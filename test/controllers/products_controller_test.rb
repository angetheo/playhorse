require 'test_helper'

class ProductsControllerTest < ActionController::TestCase

	def setup
		@request.env['HTTP_REFERER'] = '/admin/products'
	end

	# INDEX
  test "should get index" do
    get :index
    assert_response :success
  end

  # SEARCH
  test "should get and display search results" do
  	post :search, type: 'type1', category: 'cat1'

  	assert_equal 'product1', assigns(:results).first.name 
  	assert_includes @response.body, assigns(:results).first.name
  	assert_template partial: '_results.html'
  end

  # SHOW JSON
  test 'should get a single product info via AJAX request' do
  	get :show, id: products(:one).id, :format => :json, xhr: true

  	assert_equal "application/json", @response.content_type
  	assert_response :success
  end

  # CREATE
  test 'should create a new horse' do
  	assert_difference('Product.count') do
    	post :create, product_name: 'Testproduct'
  	end
    assert_equal 'Testproduct', assigns(:product).name
  	assert_response :redirect
  end

  # UPDATE
  test 'should update a single product' do
  	put :update, id: products(:one).id, edit_product_name: 'Editproduct'

  	assert_equal 'Editproduct', assigns(:product).name
    assert_response :redirect
  end

  # DESTROY
  test 'should delete the product' do
  	assert_difference('Product.count', -1) do
    	delete :destroy, id: products(:one).id
  	end
  	assert_response :redirect
  end

end
