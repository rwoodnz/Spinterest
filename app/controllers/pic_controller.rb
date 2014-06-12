require 'sinatra/json'

get '/spuns' do

  num = params[:num]
  json Pic.latest_pics(num).to_json

end
