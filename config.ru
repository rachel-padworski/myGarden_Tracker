require_relative './config/env'

use Rack::MethodOverride
use PlantsController
use UsersController
use SessionsController
run ApplicationController
