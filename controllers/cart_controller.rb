class CartController < AppController

  # Add ticket to cart.
  App.post '/tickets/:ticket_id/add' do

    ticket_id = params[:ticket_id]

    cart = Cart.new(params)
    cart.add(ticket_id)

    redirect to("/")

  end

  # List tickets in cart.
  App.get '/cart' do

    cart = Cart.new(params)
    cart.build_tickets(@@db[:tickets])
    cart.apply_discount()
    cart.render()

  end

end
