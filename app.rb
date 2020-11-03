require 'sinatra/base'
require 'sinatra/reloader'
require 'sass/plugin/rack'

class App < Sinatra::Base

  ##
  # CONFIGURATION
  ##

  use Sass::Plugin::Rack

  enable :sessions

  # Configure reloader.
  configure :development do
    register Sinatra::Reloader
  end

  ##
  # SETUP
  ##

  root = Dir.pwd

  # Load components, controllers and helpers.
  require File.join(root, '/autoloader.rb')
  include AppHelper

  # Expose root directory to components.
  @@root = root

  # On request.
  before do

    # Expose app to components.
    AppHelper::set_app(self)

    # Expose session to components.
    AppHelper::set_session(session)

    # Setup and expose database.
    AppHelper::load_db(@@root)

  end

  ##
  # SERVER
  ##

  # Start server.
  run! if app_file == $0

end
