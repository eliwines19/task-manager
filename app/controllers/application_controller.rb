class ApplicationController < ActionController::Base
    #gives access to methods in the views
    helper_method :current_user, :logged_in?, :pretty_date


    private
    
    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!session[:user_id]
    end

    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in?
    end

    def pretty_date(date)
        date.strftime(" %B %d, %Y ")
    end

end
