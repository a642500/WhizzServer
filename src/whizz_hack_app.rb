require 'sinatra'
require 'json'


get '/' do
  'Server OK'
end


get '/user/add/:name' do
  return_message = {}
  if params.has_key?('name')
    return_message[:status] = 'success'
  end
  return_message.to_json
end