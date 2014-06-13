require 'sinatra/json'

get '/spuns' do

  num = params[:num]

  pics = Pic.latest_pics(num)
  pics.each do |pic|
    pic[:favorited] = pic.favorited_by_user?(@user)
  end

  json pics.reverse.to_json

end

post '/spun' do
  title = params[:title]
  url = params[:url]
  json Pic.create(title:title,url:url).to_json

end

post '/favorite' do
  pic = Pic.find_by_id(params[:num])
  @user.favor(pic)
  if pic.nil?
    status 403
  else
    status 200
  end

end
