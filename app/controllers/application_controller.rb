require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  use Rack::Flash
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "mom-manager"
  end

  get "/" do
    if !current_user
      erb :welcome
    elsif is_logged_in? 
      redirect '/homepage'
    end 
  end

  not_found do 
    status 404
    flash[:message] = "Page not found."
    if current_user
      redirect '/homepage'
    else
      erb :welcome
    end
  end

  helpers do
    def is_logged_in?
      !!session[:user_id]
    end
    
    def current_user
      @user ||= User.find_by_id(session[:user_id])
    end
  end

  get '/homepage' do
    session[:user] = current_user
    @user = current_user
    @events = Event.all
      erb :'/homepage'    
  end

end
