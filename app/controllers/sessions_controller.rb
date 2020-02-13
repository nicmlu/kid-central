class SessionsController < ApplicationController

 get '/login' do
        if is_logged_in?
          erb :'/users/index'
        else
          redirect '/'
        end
    end

  post '/login' do 
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session["user_id"] = @user.id
      erb :'/users/index'
    else 
      redirect '/signup'
    end 

  end

  get '/logout' do 
    session.clear 
    redirect '/'
  end 
end 