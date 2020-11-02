ENV['APP_ENV'] = 'test'

require 'rspec'
require_relative '../app'

RSpec.describe App do

  def app
    App
  end

  it "should list tickets" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to match(/<li>/)
  end

end
