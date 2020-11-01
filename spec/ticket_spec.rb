ENV['APP_ENV'] = 'test'

require 'rspec'
require_relative '../app'

RSpec.describe 'Terminal Ticket' do

  def app
    App
  end

  it "show ticket" do
    get '/tickets/1411'
    expect(last_response).to be_ok
    expect(last_response.body).to include("$")
  end

end
