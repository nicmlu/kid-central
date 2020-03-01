class KidsController < ApplicationController
    
    #implement set_kids and authorized? in appropriate actions
    #utilize param Kid.new(params) Kid.update(params) etc.

    get '/kids' do #lists all kids created by user 
        @kids = current_user.kids
        @user_id = @kids[0].user_id
        @family_name = User.find("#{@user_id}").family_name
          erb :'/kids/index'
    end

    get '/kids/new' do #displays new kid form 
        erb :'/kids/new'
    end
 
    post '/kids' do 
        #creates new kid object and assigns params, saves to db, redirect to kid profile 
        @kid = Kid.new(:name => params[:name], :nickname => params[:nickname], :gender => params[:gender], :birthdate => params[:birthdate])
        #@kid = Kid.new(params)
        @kid.user_id = session[:user_id]
        if @kid.save
          redirect "/kids/#{@kid.id}"
        else
          redirect '/kids'
        end
    end

    get '/kids/:id' do #show single kid profile 
        @kid = Kid.find_by_id(params[:id])
        erb :'/kids/profile'
    end

    get '/kids/:id/edit' do  #load edit form with current info prepopulated to edit 
        @kid = Kid.find_by_id(params[:id])
        erb :'/kids/edit'
  end
 
    patch '/kids/:id' do #submits edit form, updates params, saves, redirect to display of kid profile with new info 
        set_kid
        #authorized?(@kid)
        #utilize AR .update method
        # @kid.update(params)
        @kid.name = params[:name]
        @kid.nickname = params[:nickname]
        @kid.gender = params[:gender]
        @kid.birthdate = params[:birthdate]
        @kid.save
        redirect to "/kids/#{@kid.id}"
    end

    delete '/kids/:id' do #delete action, deletes kid profile/object, redirect to kids index page
        set_kid
        @kid.delete
        redirect to '/kids'
    end

    private

    def set_kid 
        @kid = Kid.find_by_id(params[:id])
    end

end 