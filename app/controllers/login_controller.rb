enable :sessions

post '/login' do
  user = User.find_by_username(params[:username])

  if user.check_password(params[:password])
    session_login(user.id)
    redirect to '/profile'
  else
    redirect to '/'
  end
end

def session_login(id)
  session[:user_id] = id
end

def logged_in?
  session[:user_id] != nil
end
