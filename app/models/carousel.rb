class Carousel < ActiveRecord::Base
	validates :title, :subtitle, :image, presence: true, if: :title_changed?
	validates :subtitle, presence: true, if: :subtitle_changed?
	validates :image, presence: true, if: :image_changed?
end
