require './config/environment'
require_relative 'app/controllers/users_controller'


if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride
use UsersController
use KidsController
use EventsController
run ApplicationController
