ENV['APP_ENV'] = 'test'

require 'rspec'
require_relative '../app'

RSpec.describe 'Terminal Ticket' do

  def app
    App
  end

  it "lists tickets" do
    get '/'
    p expect(last_response)
    expect(last_response).to be_ok
    expect(last_response.body).to match(/<li>/)
  end

end
