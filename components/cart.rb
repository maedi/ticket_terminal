class Cart < Component

  def initialize(params)
    super

    unless @@session.key? "cart"
      @@session = { "cart" => [] }
    end

    @cart = @@session["cart"]

  end

  def add(ticket_id)

    @cart << ticket_id

  end

  def render(props)
    'TODO'
  end

end
