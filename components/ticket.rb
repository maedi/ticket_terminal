class Ticket < Component

  def initialize(params)
    super

    ticket_id = params[:ticket_id].to_i

    # Build ticket.
    @state[:ticket_id] = ticket_id

    if @@db[:tickets].key? ticket_id
      @state[:ticket] = @@db[:tickets][ticket_id]
    end

  end

  def render()

    @@app.erb :ticket, :locals => {
      :ticket_id => @state[:ticket_id],
      :ticket => @state[:ticket]
    }

  end

end
