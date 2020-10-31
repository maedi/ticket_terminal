class Tickets < Component

  def initialize
    super

    # Load ticket data.
    tickets_file = File.read('./tickets.json')
    @state[:tickets] = JSON.parse(tickets_file)

  end

  def render

    return 'TODO'

  end

end
