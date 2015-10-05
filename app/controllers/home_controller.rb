class HomeController < ApplicationController
  def index
  	@carousels = Carousel.all.sort_by(&:id)
  	@articles = Article.all.sort_by(&:created_at).reverse.first(3)
  	@services = Service.all.sort_by(&:id)

  	@last_tweet = $twitter.user_timeline('playhorsefarm', {count: 1})[0]
  	@last_instagram = initialize_instagram
  end

  private

  def initialize_instagram
  	@last_post = HTTParty.get("https://api.instagram.com/v1/users/1902462206/media/recent/?client_id=#{ENV['INSTAGRAM_CLIENT_ID']}")['data'].first
  	@last_post['caption'] ||= { 'text' => "Seguici su instagram per gli ultimi aggiornamenti su Play Horse Farm! " }
  	@last_post['caption']['text'] += '...' if @last_post['caption']['text'].size > 200

  	return @last_post
  end
end
