require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "mom-manager"
  end

  get "/" do
      erb :welcome
  end

  get "/" do
    if !is_logged_in?
      erb :'/homepage'
    else
      redirect "/"
    end
  end

  helpers do
    def is_logged_in?
      !!session[:user_id]
    end
    
    def current_user
      User.find(session[:user_id])
    end
  end

  get '/homepage' do
    session[:user] = current_user
    @user = current_user
    @events = Event.all
      erb :'/homepage'    
  end

end
