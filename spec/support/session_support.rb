module SessionSupport
	def sign_in
		session[:user] = '12345'
	end

	def logout
		session.clear
	end
end

RSpec.configure do |c|
  c.include SessionSupport
end