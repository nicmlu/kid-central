class UsersController < ApplicationController

    get '/signup' do
          erb :'/users/signup'
    end

    post '/signup' do
        @user = User.new(params)
        
        if @user.save
          session[:user_id] = @user.id
          redirect to '/users/index'
        else
          flash[:message] = "Please enter a valid username and email address to gain access."
          redirect to "/signup"
        end
    end

end 