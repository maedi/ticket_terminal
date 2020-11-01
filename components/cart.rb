require 'money'
require 'monetize'

# @see https://github.com/RubyMoney/money/issues/593
I18n.enforce_available_locales = false

class Cart < Component

  def initialize(params)
    super

    # Get cart from session.
    unless @@session.key? "cart"
      @@session = { "cart" => [] }
    end
    @cart = @@session["cart"]

    # Get tickets in cart and their total.
    @state[:total] = 0
    @state[:tickets] = []

    @cart.each do |ticket_id|
      ticket_id = ticket_id.to_i
      if @@db[:tickets].key? ticket_id

        ticket = @@db[:tickets][ticket_id]
        @state[:total] += Monetize.parse(ticket[:price]).cents
        @state[:tickets] << ticket

      end
    end

  end

  # Add a ticket to the cart.
  def add(ticket_id)
    @cart << ticket_id
  end

  def render()

    # List and show total of tickets in cart.
    unless @cart.empty?
      return @@app.erb :cart, :layout => nil, :locals => {
        :total => Money.new(@state[:total], "USD").format,
        :tickets => @state[:tickets]
      }
    else
      return "Cart currently empty."
    end

  end

end
