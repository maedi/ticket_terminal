require 'sinatra/base'
require 'sinatra/reloader'

class TicketTerminal < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  # Load a list of products from a file.

  get '/' do
    'Hello world!'
  end

  # List product details to the user.

  # Add products to a Shopping Cart.

  # Apply promotional discounts.

  # Calculate and display the total cost.

end
