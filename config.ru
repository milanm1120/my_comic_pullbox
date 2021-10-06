require './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end


# Add all controllers here!

use Rack::MethodOverride    #Allows form to submit a 'PUT', 'PATCH', or 'DELETE' request
use ComicbookController
use UserController
run ApplicationController
