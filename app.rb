require 'sinatra/base'
require 'sinatra/reloader'

class App < Sinatra::Base

  ##
  # CONFIGURATION
  ##

  # Load components and helpers.
  set :root, File.dirname(__FILE__)
  require File.join(root, '/autoloader.rb')

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
