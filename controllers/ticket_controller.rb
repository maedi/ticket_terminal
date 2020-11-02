require 'sinatra/base'
require 'sinatra/reloader'

class TicketController < Sinatra::Base

  include AppHelper

  # Home.
  get ['/', '/tickets'] do

    # List available tickets.
    tickets = Tickets.new(params)

    # List tickets in cart.
    cart = Cart.new(params)
    cart.build_tickets(@@db[:tickets])
    cart.apply_discount()

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

end
