class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token
    skip_before_action :require_login, only:[:destroy]
    def new 
    end
    def create
        user=Author.find_by(email: params[:email]);
        if(user!=nil&&user.authenticate(params[:password])!=false)
         session[:user_id]=user.id
         render html: 'session created'
        else
         render json: params[:password];
        end
    end
    def destroy
        session.clear
        render html: 'Session delted'
    end
end
