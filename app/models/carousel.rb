class Carousel < ActiveRecord::Base
	validates :title, :subtitle, :image, presence: true	
end
