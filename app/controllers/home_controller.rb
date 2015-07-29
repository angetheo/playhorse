class HomeController < ApplicationController
  def index
  	@carousels = Carousel.all
  	@articles = Article.all.sort_by(&:created_at).reverse.first(3)

  	@last_tweet = twitter_login.user_timeline('playhorsefarm', {count: 1})[0]
  	@last_instagram = HTTParty.get("https://api.instagram.com/v1/users/1902462206/media/recent/?client_id=#{ENV['INSTAGRAM_CLIENT_ID']}")['data'].first
  end
end
