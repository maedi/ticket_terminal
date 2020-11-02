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
  # ROUTES
  ##

  # Home.
  get ['/', '/tickets'] do

    # List available tickets.
    tickets = Tickets.new(params)

    # List tickets in cart.
    cart = Cart.new(params)
    cart.list_tickets(@@db[:tickets])
    cart.apply_discount(params)

    return [
      tickets.render({tickets: @@db[:tickets]}),
      cart.render()
    ]

  end

  # Show ticket.
  get '/tickets/:ticket_id' do

    ticket = Ticket.new(params)
    ticket.render()

  end

  # Add ticket to cart.
  post '/tickets/:ticket_id/add' do

    ticket_id = params[:ticket_id]

    cart = Cart.new(params)
    cart.add(ticket_id)

    redirect to("/")

  end

  # List tickets in cart.
  get '/cart' do

    cart = Cart.new(params)
    cart.list_tickets(@@db[:tickets])
    cart.apply_discount(params)
    cart.render()

  end

  ##
  # SERVER
  ##

  # Start server.
  run! if app_file == $0

end
