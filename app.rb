require 'sinatra/base'
require 'sinatra/reloader'
require 'sass/plugin/rack'

class App < Sinatra::Base

  use Sass::Plugin::Rack

  ##
  # SETUP
  ##

  root = Dir.pwd

  # Load components and helpers.
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
  # CONFIGURATION
  ##

  enable :sessions

  # Configure reloader.
  configure :development do
    register Sinatra::Reloader
  end

  ##
  # SERVER
  ##

  # Start server.
  run! if app_file == $0

end
