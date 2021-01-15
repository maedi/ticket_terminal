require 'erb'
require 'json'

class Tickets < Component

  def render(props)
    @@app.erb :tickets, :locals => { :tickets => props[:tickets] }
  end

end
