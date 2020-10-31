class Tickets

  def render

    # Load ticket data.
    tickets_file = File.read('./tickets.json')
    tickets_data = JSON.parse(tickets_file)

    return 'TODO'

  end

end
