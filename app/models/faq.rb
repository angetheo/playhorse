class Faq < ActiveRecord::Base
	def self.categories
		Faq.pluck('DISTINCT category')
	end
end
