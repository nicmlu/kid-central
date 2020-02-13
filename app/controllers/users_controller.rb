class UsersController < ApplicationController

    get '/users/index' do
          erb :'/users/index'
    end

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
            erb :'/users/index'
        end 
    end

end 