class Article < ActiveRecord::Base
	validates :title, :subtitle, :content, presence: true	
end
