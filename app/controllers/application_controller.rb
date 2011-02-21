class ApplicationController < ActionController::Base
  protect_from_forgery
	protected
		def current_user
			return unless session[:user_id]
			@current_user = User.find session[:user_id]
		end

		helper_method :current_user

		def authenticate
			logged_in? ? true : access_denied
		end

		def logged_in?
			current_user.is_a? User
		end

		helper_method :logged_in?

		def access_denied
			flash[:notice] = "Please log in to continue"
			redirect_to login_url and return false
		end
end
