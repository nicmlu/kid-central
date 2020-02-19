## Kid Central 

This Sinatra MVC app was built as a project for Flatiron school. It allows users to signup, login, create kids profiles, create events and view all kids profiles and events. It serves as a basic planner for parents.

## Getting Started
To run this app locally, fork and clone this GitHub repo to your local machine, using the terminal.

```git@github.com:nicmlu/kid-central.git```

Change directories into the repo directory and run the $bundle install command.

```cd kid-central``` <br />
```bundle install```
    
Run the $shotgun command to start an automatic reloading version of a rackup.

```shotgun```

Navigate to the route displayed in the terminal. (E.g. http://127.0.0.1:9393)

## Prerequisites
Shotgun requires Linux, Mac OSX or Linux VM on Windows. Other than the gems listed in this app's Gemfile, you will need to have Ruby installed on your local machine as well as the ability to install Ruby gems.

## App Interaction Instructions
After making any changes in the code, reload your browser window to make a new request and see your changes. Navigate to the routes in application_controller and user_controller to create new User objects; create, read update and destroy both Kid and Event objects.

## Deployment
This app is meant for a development environment only. If you intend to alter this app for a live environment, additional security protocols should be put in place.

## Built With
Sinatra <br />
ActiveRecord <br />
Corneal

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/nicmlu/kid-central. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

Looking for a specific way to contribute?

Expand functionality for the user by tracking other important activities including school trips, doctors visits, etc. 
Create new kid profiles and events 
Reorganize events to display in chronological order 
Display events each child is invited to on their profile page 

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).