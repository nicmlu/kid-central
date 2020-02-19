class UsersController < ApplicationController

    get '/signup' do
          erb :'/users/signup'
    end

    post '/signup' do
        if  params[:email].empty? || params[:password].empty? || params[:name].empty? || params[:family_name].empty? 
              flash[:alert] = "Information missing! Please complete the entire signup form with a valid email address and password to create an account!"
            redirect '/signup'
        else 
            @user = User.create(name: params["name"], family_name: params["family_name"], email: params["email"], password: params["password"])
            @user.save
            session[:user_id] = @user.id
            erb :'/homepage'
        end 
    end

    get '/login' do 
      current_user ? (erb :'/homepage') : (erb :'/welcome')
    
    end

    post '/login' do 
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session["user_id"] = @user.id
      @events = Event.all
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