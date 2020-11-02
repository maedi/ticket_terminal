require 'money'
require 'monetize'
require 'bigdecimal'

# @see https://github.com/RubyMoney/money/issues/593
I18n.enforce_available_locales = false
# @see https://github.com/RubyMoney/money#localization
Money.locale_backend = :i18n
Money.rounding_mode = BigDecimal::ROUND_HALF_EVEN
Money.default_currency = "USD"

class Cart < Component

  attr_accessor :items

  def initialize(params)
    super

    @state[:tickets] = []
    @state[:message] = nil
    @state[:discount_applied] = false
    @state[:total] = 0

    # Get cart from session.
    unless @@session.key? "cart"
      @@session = { "cart" => [] }
    end
    @items = @@session["cart"]

  end

  # List tickets in cart and their total.
  def build_tickets(tickets)

    @items.each do |ticket_id|
      ticket_id = ticket_id.to_i
      if tickets.key? ticket_id

        ticket = tickets[ticket_id]
        @state[:total] += Monetize.parse(ticket[:price]).cents
        @state[:tickets] << ticket

      end
    end

  end

  def apply_discount()

    # Determine discount.
    discounter = Discounter.new()
    discount = discounter.get_discount(@state[:total])

    # Apply discount.
    if discount > 0

      @state[:discount_applied] = true

      # Add discounted prices to tickets.
      @state[:tickets].each do |ticket|
        new_price = Monetize.parse(ticket[:price]).cents * (1 - discount)
        ticket[:discount_price] = Money.new(new_price).format
      end

      # Discount the total.
      @state[:total] = @state[:total] * (1 - discount)

      # Show message about discount.
      discount_percentage = (discount * 100).to_i.to_s + "%"
      threshold = discounter.get_threshold(discount)
      @state[:message] = "Discount applied: #{discount_percentage} off on total greater than $#{threshold}."

    end

  end

  # Add a ticket to the cart.
  def add(ticket_id)
    @items << ticket_id
  end

  def total()
    @state[:total]
  end

  def render()

    # List and show total of tickets in cart.
    unless @items.empty?
      return @@app.erb :cart, :layout => nil, :locals => {
        :tickets => @state[:tickets],
        :message => @state[:message],
        :discount_applied => @state[:discount_applied],
        :total => Money.new(@state[:total]).format
      }
    end

    @@app.erb :cart_empty, :layout => nil

  end

end
