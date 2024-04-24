class SessionsController < ApplicationController
    before_action :logged_in_redirect, only: [:new, :create]
    def new
        
    end

    def create
        user = User.find_by(username, params[:session][:username])
        if user && user.authenticate(params[:session][:username])
            session[:user_id] = user_id
            flash[:success] = "You are logged in successfully"
            redirect_to root_path
        else
          flash.now[:error] = "There was something wrong with your login information"  
          render 'new'
        end
        
    end

    private

    def logged_in_redirect
        if logged_in?
            flash[:error] = "You are alredy logged"
            redirect_to root_path
        end
    end
end