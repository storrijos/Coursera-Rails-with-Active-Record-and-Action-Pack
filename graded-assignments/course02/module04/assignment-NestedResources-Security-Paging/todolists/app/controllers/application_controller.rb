class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception

    before_action :ensure_login

    helper_method :logged_in?, :current_user

    def logged_in?
        session[:user_id]
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]         
    end

    def ensure_login
        unless logged_in?
            redirect_to login_path
        end
    end


end
