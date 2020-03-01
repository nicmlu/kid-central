class UsersController < ApplicationController

    get '/signup' do
      if is_logged_in?
            redirect '/homepage'
        elsif session[:current_errors] && session[:current_errors].include?("Username has already been taken") && session[:current_errors].include?("Email has already been taken")
                session[:current_errors].clear
                session[:current_errors] << "You already have an account. Try signing in"
                redirect '/login'
        else 
            erb :'/users/signup'
      end 
    end

    post '/signup' do
      @user = User.new(params)
        if  @user.save
          session[:user_id] = @user.id
          erb :'/homepage'
        else 
          flash[:alert] = "User not created"
        end 
    end

    get '/login' do 
      current_user ? (erb :'/homepage') : (erb :'/welcome')
    end

    post '/login' do 
    @user = User.find_by(email: params[:email])

      if @user && @user.authenticate(params[:password])
        session["user_id"] = @user.id
        @events = current_user.events
        erb :'/homepage'
      else 
        flash[:alert] = "Log in details incorrect. Try again."
        redirect '/login'
      end 
    end

    get '/logout' do 
    session.clear 
    redirect '/'
  end 

end 