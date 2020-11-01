class Ticket < Component

  def initialize(params)
    super

    p params

  end

  def render(props)

    @@app.erb :ticket, :locals => {
      :ticket_id => props[:ticket_id],
      :ticket => props[:ticket]
    }

  end

end
