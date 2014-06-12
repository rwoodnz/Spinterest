require 'sinatra/json'

get '/spuns' do

  num = params[:num]
  json Pic.latest_pics(num).to_json

end

post '/spun' do
  title = params[:title]
  url = params[:url]
  json Pic.create(title:title,url:url).to_json

end
