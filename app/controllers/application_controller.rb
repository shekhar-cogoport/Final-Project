class ApplicationController < ActionController::Base
# include JsonWebToken
  def not_found
    render json: { error: 'not_found' }
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = Author.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: 'Problem with login-2' }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: 'Problem with login' }, status: :unauthorized
    end
  end
end


# helper_method :current_user
# helper_method :logged_in? 
# before_action :require_login
# def logged_in?
#     if(session[:user_id]!=nil)
#     return true;
#     else
#     return false;
#     end
# end    

# def require_login
#     if ((logged_in?)==true)
#     render html: 'Already logged in'
#     end
# end

# def current_user
#     if session[:user_id]
#     @current_user ||= User.find(session[:user_id]) 
#     end
# end