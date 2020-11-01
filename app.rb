require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'helpers/app_helper.rb'

class App < Sinatra::Base

  include AppHelper

  ##
  # CONFIGURATION
  ##

  @@root = Dir.pwd

  # Expose app to components.
  before do
    set_app(self)
  end

  # Load components and helpers.
  require File.join(@@root, '/autoloader.rb')

  # Configure reloader.
  configure :development do
    register Sinatra::Reloader
  end

  ##
  # ROUTES
  ##

  # List all tickets.
  get '/' do
    tickets = Tickets.new(params)
    tickets.render()
  end

  # Show ticket.
  get '/tickets/:ticket_id' do
    # TODO.
  end

  # List tickets in cart.
  get '/cart' do
    cart = Cart.new(params)
    cart.render()
  end

  # Add products to a Shopping Cart.

  # Apply promotional discounts.

  # Calculate and display the total cost.

  ##
  # SERVER
  ##

  # Start server.
  run! if app_file == $0

end
