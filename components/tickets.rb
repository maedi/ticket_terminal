require 'erb'
require 'json'
#require_relative '../helpers/app_helper.rb'

class Tickets < Component

  #register Sinatra::AppHelper

  def initialize(params)
    super

    # Load ticket data.
    tickets_file = File.read('../tickets.json')
    @state[:tickets] = JSON.parse(tickets_file)

  end

  def render

    return "TICKETS"

    erb :tickets, :locals => { :tickets => @state[:tickets] }
    #template(@state, :tickets)

  end

end
