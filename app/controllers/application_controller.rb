class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	
	private

	# def authorize
	#   return if User.count.zero?
	#   unless User.find_by(id: session[:user_id])
	#   	redirect_to login_url, notice: "Please log in"
	#   end
 #  end
end
