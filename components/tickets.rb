require 'erb'
require 'json'

class Tickets < Component

  def initialize(params)
    super

    # Load ticket data.
    tickets_file = File.read(File.join(@@root, 'tickets.json'))
    @state[:tickets] = JSON.parse(tickets_file)

  end

  def render()

    @@app.erb :tickets, :locals => { :tickets => @state[:tickets] }

  end

end
