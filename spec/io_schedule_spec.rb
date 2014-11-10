require_relative "spec_helper"
require_relative "../io_schedule.rb"

def app
  IoSchedule
end

describe IoSchedule do
  it "responds with a welcome message" do
    get '/'

    last_response.body.must_include 'Welcome to the Sinatra Template!'
  end
end
