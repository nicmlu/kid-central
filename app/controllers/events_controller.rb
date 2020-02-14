class EventsController < ApplicationController

    get '/events' do #lists all events created by user 
        @events = Event.all
        @user = User.find_by_id(session[:user_id])
        @family_name = @user.family_name
        
          erb :'/events/index'
    end

    get '/events/new' do #displays new event form 
        # @kid_id = 
        # binding.pry
        erb :'/events/new'
    end
 
    post '/events' do 
        #creates new event object and assigns params, saves to db, redirect to event show
        @event = Event.new(:name => params[:name], :date => params[:date], :time => params[:time], :location => params[:location], :rsvp => params[:rsvp], :gift => params[:gift], :note => params[:note], :kid_id => params[:kid_id])
        @event.user_id = session[:user_id]
        if @event.save
          redirect "/events/#{@event.id}"
        else
          redirect '/events'
        end
    end

    get '/events/:id' do #show single kid profile 
        @event = Event.find_by_id(params[:id])
        erb :'/events/show'
    end

    get '/events/:id/edit' do  #load edit form with current info prepopulated to edit 
        @event = Event.find_by_id(params[:id])
        erb :'/events/edit'
  end
 
    patch '/events/:id' do #submits edit form, updates params, saves, redirect to display of kid profile with new info 
        @event = Event.find_by_id(params[:id])

        @event.date = params[:date]
        @event.time = params[:time]
        @event.location = params[:location]
        @event.rsvp = params[:rsvp]
        @event.gift = params[:gift]
        @event.note = params[:note]
        @event.save

        redirect to "/events/#{@event.id}"
    end

    delete '/events/:id' do #delete action, deletes kid profile/object, redirect to kids index page
        @event = Event.find_by_id(params[:id])
        @event.delete
        redirect to '/events'
    end

end 