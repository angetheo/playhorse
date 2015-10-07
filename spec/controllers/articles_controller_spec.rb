require 'rails_helper'
require 'support/session_support'

RSpec.describe ArticlesController, :type => :controller do

	before(:each) do 
		sign_in
		@request.env['HTTP_REFERER'] = '/admin/home'
		@article = Article.create(title: 'title', subtitle: 'subtitle', content: 'content', image: 'image', views: 0)
	end

	describe 'GET index' do
		it 'should return http success' do
			get :index
			expect(response).to have_http_status(:success)
		end
	end

	describe 'GET show' do
		context 'when the format is html' do
			render_views
			before(:each) { get :show, id: @article.id, format: :html }

			it 'should return http success when authenticated' do
				expect(response).to have_http_status(:success)
			end

			it 'should return the article if the request is in html format' do
				expect(response.body).to include('title')
			end
		end

		context 'when the format is xhr' do
			before(:each) { get :show, id: @article.id, format: :json }

			it 'should return the article for the ajax request' do
				expect(response).to have_http_status(:success)
			end
		end
	end

	describe 'POST create' do

		before(:each) do
			@file = Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/testfile.txt'), 'text/txt') 
			allow_any_instance_of(ApplicationController).to receive(:upload).and_return('test') 
		end

		it 'should create a new article' do
			expect{
				post :create, 
					article_title: 'new title',
					article_subtitle: 'new subtitle',
					article_content: 'new_content',
					article_image: @file
			}.to change{Article.count}.by(1)
		end

		it 'should not create a new article if not authenticated' do
			logout
			expect{
				post :create, 
					article_title: 'i did not',
					article_subtitle: 'login',
					article_content: 'lol',
					article_image: @file
			}.not_to change{Article.count}
			expect(flash[:alert]).to be_present
		end

		it 'should not create a new article if validations fail' do
			expect{
				post :create, 
					article_title: 'empty article',
					article_subtitle: 'without content and image'
			}.not_to change{Article.count}
		end
	end

	describe 'PUT update' do

		it 'should update a specific article' do
			put :update,
				id: @article.id,
				edit_article_title: 'edit title',
				edit_article_subtitle: 'edit_subtitle',
				edit_article_content: 'edit_content'

			@article.reload
			expect(@article.title).to eq('edit title')
		end

		it 'should not update the article if not authenticated' do
			logout
			put :update,
				id: @article.id,
				edit_article_title: 'edit title',
				edit_article_subtitle: 'edit_subtitle',
				edit_article_content: 'edit_content'

			@article.reload
			expect(@article.title).to eq('title')
		end

		it 'should not update the article if validations fail' do
			put :update,
				id: @article.id,
				edit_article_title: 'title with no article?' 

			@article.reload
			expect(@article.title).to eq('title')
			expect(flash[:notice]).to be_present
		end
	end

	describe 'DELETE destroy' do
		it 'should destroy the selected article' do
			expect{
				delete :destroy, id: @article.id
			}.to change{Article.count}.by(-1)
		end

		it 'should not destroy the article if not authenticated' do
			logout
			expect{
				delete :destroy, id: @article.id
			}.not_to change{Article.count}
		end
	end
end



