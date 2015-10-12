require 'rails_helper'
require 'support/session_support'

RSpec.describe CarouselController, :type => :controller do

  before(:each) do
    sign_in
    @request.env['HTTP_REFERER'] = '/admin/home'
    @carousel = Carousel.create(title: 'title', subtitle: 'subtitle', image: 'image')
  end

  describe "GET show" do
    it "returns http success" do
      get :show, id: @carousel.id, format: :json
      expect(response).to have_http_status(:success)
    end

    it "redirects an unauthorized user" do
      logout
      get :show, id: @carousel.id, format: :json
      expect(response).to have_http_status(:redirect)
      expect(flash[:alert]).to be_present
    end
  end


  describe "PUT update" do
    it "returns http redirect" do
      put :update, id: @carousel.id
      expect(response).to have_http_status(:redirect)
    end

    it "changes the content of the carousel" do
      file = Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/testfile.txt'), 'text/txt')
      allow_any_instance_of(ApplicationController).to receive(:upload).and_return('test')

      put :update, 
        id: @carousel.id,
        edit_carousel_title: 'new title',
        edit_carousel_subtitle: 'new subtitle',
        edit_carousel_image: file

      @carousel.reload
      expect(@carousel.title).to eq('new title')
    end

    it "doesn't change the content if validations fail" do
      put :update,
        id: @carousel.id,
        edit_carousel_title: '',
        edit_carousel_subtitle: 'empty title??'

      @carousel.reload
      expect(@carousel.title).to eq('title')
      expect(@carousel.subtitle).to eq('subtitle')
    end
  end

end