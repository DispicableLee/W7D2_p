class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    # CHRLLL
    helper_method :current_user, :logged_in?

    def login(user)
        session[:session_token] = user.reset_session_token!
    end

    def current_user
        @current_user = User.find_by(session_token: session[:session_token])
    end

    def logged_in?
        !!current_user
    end

    def require_login
        # debugger
        redirect_to new_session_url unless logged_in?
    end

    def require_logout

        redirect_to user_url(current_user) if logged_in?
    end

    def logout
        current_user.reset_session_token!
        session[:session_token] = nil
    end

end
