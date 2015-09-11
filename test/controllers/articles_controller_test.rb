require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase

	# SETUP
	def setup
		@request.env['HTTP_REFERER'] = '/admin/articles'
		@article = articles(:one)
	end

	# INDEX
  test "should get index" do
    get :index

    assert_response :success
  end

  # SHOW JSON
  test 'should get a single article via AJAX request' do
  	get :show, id: @article.id, :format => :json, xhr: true

  	assert_response :success
  	assert_equal "application/json", @response.content_type
  end

  # SHOW HTML
  test 'should get a single article' do
  	get :show, id: @article.id

  	assert_response :success
  	assert_includes @response.body, @article.title
  end

  # CREATE
  test 'should create a new article' do
  	@request.env['HTTP_REFERER'] = '/admin/articles'
  	assert_difference('Article.count') do
    	post :create, params: { article: { title: 'Some title', subtitle: 'subtitle', content: 'content', image: '', views: 0} }
  	end
  	assert_response :redirect
  end

  # UPDATE
  test 'should update a single article' do
  	put :update, id: @article.id, params: { article: { title: 'different title' } }

  	assert_response :redirect
  	assert_equal @article.title, Article.first.title
  end

  # DESTROY
  test 'should delete the article' do
  	assert_difference('Article.count', -1) do
    	delete :destroy, id: @article.id
  	end
  	assert_response :redirect
  end
end
