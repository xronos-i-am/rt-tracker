require 'rack/test'

module RequestHelper
  include ::Rack::Test::Methods

  def app
    RtTracker::Routes::API.app
  end

  def response
    last_response
  end

  def status
    last_response.status
  end

  def json_response
    JSON.parse(response.body, symbolize_names: true)
  end
end
