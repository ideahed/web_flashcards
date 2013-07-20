enable :sessions

post '/create_user' do
  user = User.new(user_name: params[:user_name], email: params[:email])
  user.password = params[:password]
  user.save
  start_session(user)
  erb :user_dashboard
end

post '/authenticate_user' do
  user = User.authenticate(params[:email], params[:password])
  p user
  if user
    start_session(user)
    return erb :user_dashboard
  end
  erb :index #redirect to index if user/pass incorrect
end

get '/logout' do
  session.clear
  redirect '/'
end
