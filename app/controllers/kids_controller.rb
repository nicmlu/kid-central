class KidsController < ApplicationController
    get '/kids' do #lists all kids created by user 
        if is_logged_in?
            @kids = current_user.kids
            @user_id = @kids[0].user_id
            @family_name = User.find("#{@user_id}").family_name
            erb :'/kids/index'
        else 
            redirect '/'
        end 
    end

    get '/kids/new' do #displays new kid form 
         current_user ? (erb :'/kids/new') : (redirect '/login')
    end
 
    post '/kids' do 
        #creates new kid object and assigns params, saves to db, redirect to kid profile 
        @kid = Kid.new(params)
        @kid.user_id = session[:user_id]
        if @kid.save
          redirect "/kids/#{@kid.id}"
        else
          flash[:alert] = "Kid Profile not created"
          redirect '/kids'
        end
    end

    get '/kids/:id' do #show single kid profile 
        set_kid
        # binding.pry
        if is_logged_in? 
            if !@kid
                flash[:alert] = "Kid Profile does not exist"
                redirect '/kids'
            elsif 
                @kid.user_id == current_user.id
                erb :'/kids/profile'
            else 
                flash[:alert] = "Kid Profile is not connected to this account! Please select another Kid."
                redirect '/kids'
            end 
        else 
            flash[:alert] = "Please log In"
            redirect '/'
        end 
    end

    get '/kids/:id/edit' do  #load edit form with current info prepopulated to edit 
        set_kid
        if is_logged_in?
            if  !@kid
                flash[:alert] = "Kid Profile does not exist"
                redirect '/kids'
            elsif 
                @kid.user_id == current_user
                erb :'/kids/edit'
            else
                redirect "/kids"
            end
        else
            flash[:alert] = "Please log In"
            redirect '/'
        end
    end
 
    patch '/kids/:id' do #submits edit form, updates params, saves, redirect to display of kid profile with new info 
        set_kid
        if @kid.user_id == current_user
            @kid.update(:name => params[:name], :nickname => params[:nickname], :gender => params[:gender], :birthdate => params[:birthdate])
            redirect to "/kids/#{@kid.id}"
        else 
        redirect to "/kids"
        end 
    end

    delete '/kids/:id' do #delete action, deletes kid profile/object, redirect to kids index page
        set_kid
        if is_logged_in?
            if @kid.user_id == current_user
                @kid.delete
                redirect "/kids"
            else
                redirect "/homepage"
            end
        else
            flash[:alert] = "Please log In"
            redirect '/'
        end
    end

    private

    def set_kid 
        @kid = Kid.find_by_id(params[:id])
    end

end 