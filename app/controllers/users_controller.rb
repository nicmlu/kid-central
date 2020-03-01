class UsersController < ApplicationController

    get '/signup' do
          erb :'/users/signup'
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
    if session[:user_id] == current_user.id
      redirect "/homepage"
    end
    end

    get '/logout' do 
    session.clear 
    redirect '/'
  end 

end 