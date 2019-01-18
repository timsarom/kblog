class SessionsController < ApplicationController
  def new
  end

  def create
  	if User.count.zero?
      redirect_to new_user_path
    else
    	user = User.find_by(name: params[:name])
    	if user.try(:authenticate, params[:password])
    		session[:user_id] = user.id
    		redirect_to posts_url
    	else
    		redirect_to login_url, alert: "Invalid username or password"
    	end
    end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to posts_url, notice: "Logged out"
  end
end
