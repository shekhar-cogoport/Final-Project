class AuthenticationController < ApplicationController
  # skip_before_action :verify_authenticity_token
  # include JsonWebToken
  protect_from_forgery with: :null_session
  before_action :authorize_request, except: :login

  def login
    @user = Author.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     userid: @user.id,name: @user.name}, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
