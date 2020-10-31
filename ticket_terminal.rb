require 'sinatra/base'
require 'sinatra/reloader'
require 'json'

class TicketTerminal < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  # List all tickets.
  get '/' do

    # Load ticket data.
    tickets_file = File.read('./tickets.json')
    tickets_data = JSON.parse(tickets_file)

    return 'TODO'

  end

  # List product details to the user.

  # Add products to a Shopping Cart.

  # Apply promotional discounts.

  # Calculate and display the total cost.


  # Start server.
  run! if app_file == $0

end
