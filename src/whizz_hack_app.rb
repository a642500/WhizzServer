require 'sinatra'
require 'json'
require 'haml'


get '/' do
  'Server OK'
end


get '/user/add' do
  name = params['hostname']
  id = params['id']
  ip = params['ip']
  model = params['model']

  return_message = {}
  if params.has_key?('hostname') and params.has_key?('id')
    return_message[:status] = 'success'
    return_message[:name] = name
    return_message[:ip] = request.ip
  end
  return_message.to_json
end

get '/user/:id/upload' do
  haml :upload
end

post '/user/:id/upload' do

  dir = File.expand_path(params[:id],'uploads')
  unless File.directory?(dir)
    FileUtils.mkdir_p(dir)
  end
  
  File.open('uploads/'+params[:id]+'/'+params['file'][:filename], 'w') do |f|
    f.write(params['file'][:tempfile].read)
  end
  {:status => 'success'}.to_json
end