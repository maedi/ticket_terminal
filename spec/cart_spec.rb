ENV['APP_ENV'] = 'test'

require 'rspec'
require_relative '../app'

RSpec.describe Cart do

  def app
    App
  end

  before do

    @db = AppHelper::load_db(Dir.pwd)

  end

  it "should add a ticket to the cart" do

    ticket_id = 1411

    # Add ticket to cart.
    cart = Cart.new(nil)
    cart.add(ticket_id)

    # Ensure ticket added to cart.
    expect(cart.items).to include(ticket_id)

  end

  it "should apply discount" do

    # Add multiple tickets to cart to trigger discount.
    cart = Cart.new(nil)
    cart.add(1411)
    cart.add(13008)

    # Get total.
    cart.build_tickets(@db[:tickets])
    pre_discounted_total = cart.total()

    # Apply discount.
    cart.apply_discount()

    # Assert discount applied.
    expect(cart.total()).to be < pre_discounted_total

  end

end
