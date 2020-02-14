class UsersController < ApplicationController

    get '/signup' do
          erb :'/users/signup'
    end

    post '/signup' do
        if  params[:email].empty? || params[:password].empty?
            #   flash[:alert] = "Please enter a valid email address to create an account!"
            redirect to "/signup"
        else 
            @user = User.create(name: params["name"], family_name: params["family_name"], email: params["email"], password: params["password"])
            @user.save
            session[:user_id] = @user.id
            erb :'/homepage'
        end 
    end

    get '/login' do 
    erb :welcome
    end

    post '/login' do 
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session["user_id"] = @user.id
      @events = Event.all
      erb :'/homepage'
    else 
      redirect '/'
    end 

    end

    get '/logout' do 
    session.clear 
    redirect '/'
  end 

end 