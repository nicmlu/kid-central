class EventsController < ApplicationController

    get '/events' do #lists all events created by user 
        if is_logged_in?
            @events = current_user.events
            erb :'/events/index'
        else
            redirect '/'
        end
    end

    get '/events/new' do #displays new event form 
        current_user ? (erb :'/events/new') : (redirect '/login')
    end
 
    post '/events' do 
        #creates new event object and assigns params, saves to db, redirect to event show
        @event = current_user.events.build(params)
        if @event.save
          redirect "/events/#{@event.id}"
        else
          flash[:alert] = "Event not created"
          redirect '/events'
        end
    end

    get '/events/:id' do #show single event profile 
        if is_logged_in? 
            @event = Event.find_by_id(params[:id])
            if @event 
                erb :'/events/show'
            else 
                flash[:alert] = "Event does not exist"
                redirect '/events'
            end 
        else 
            flash[:alert] = "Please log In"
            redirect '/'
    end

    get '/events/:id/edit' do  #load edit form with current info prepopulated to edit 
          @event = Event.find_by_id(params[:id])
        if is_logged_in?
            if  @event.user == current_user
                erb :'/events/edit'
            else
                redirect "/events"
            end
        else
            redirect '/'
        end
  end
 
    patch '/events/:id' do #submits edit form, updates params, saves, redirect to display of kid profile with new info 
        @event = Event.find_by_id(params[:id])
        if event.user == current_user
            @event.update(params)
            redirect to "/events/#{@event.id}"
        else 
        redirect to "/events"
        end 
    end

    delete '/events/:id' do #delete action, deletes kid profile/object, redirect to kids index page
        @event = Event.find_by_id(params[:id])
        if is_logged_in?
            if event.user == current_user
                event.delete
                redirect "/events"
            else
                redirect "/homepage"
            end
        else
            redirect '/'
        end
    end

end 