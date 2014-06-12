enable :sessions

before do
  @user = User.find_by_id(session[:user_id])
end

post '/login' do
  user = User.find_by_username(params[:username])

  if user.check_password(params[:password])
    session_login(user.id)
    redirect to request.referrer
  else
    redirect to '/'
  end
end

get '/logout' do
  session[:user_id] = nil

  redirect to '/'
end

def session_login(id)
  session[:user_id] = id
end

def logged_in?
  session[:user_id] != nil
end
