ENV['RACK_ENV'] = 'test'


require_relative '../src/whizz_hack_app'
require 'minitest/autorun'
require 'rack/test'



class MyTest < MiniTest::Unit::TestCase

  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_hello_world
    get '/'
    assert last_response.ok?
    assert_equal "Hello, World!", last_response.body
  end
end