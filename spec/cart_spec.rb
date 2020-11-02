ENV['APP_ENV'] = 'test'

require 'rspec'
require_relative '../app'

RSpec.describe Cart do

  def app
    App
  end

  it "should add a ticket to the cart" do

    ticket_id = 1411

    # Add ticket to cart.
    cart = Cart.new(nil)
    cart.add(ticket_id)

    # Ensure ticket added to cart.
    expect(cart.items).to include(ticket_id)

  end

end
