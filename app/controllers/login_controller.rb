post '/login' do
  user = User.find_by_username(params[:username])

  if user.check_password(params[:password])
    redirect to '/profile'
  else
    redirect to '/'
  end
end
