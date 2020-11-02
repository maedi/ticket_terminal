ENV['APP_ENV'] = 'test'

require 'rspec'
require_relative '../app'

RSpec.describe 'Tickets' do

  def app
    App
  end

  it "lists tickets" do
    get '/tickets'
    expect(last_response).to be_ok
    expect(last_response.body).to match(/<li>/)
  end

  it "shows empty cart" do
    get '/tickets'
    expect(last_response.body).to include('<div class="empty">')
  end

end


#.or(include('<div class="total">'))
