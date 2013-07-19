
post '/create_user' do
  p params
  user = User.new(user_name: params[:user_name], email: params[:email])
  user.password = params[:password]
  user.save
end

enable :sessions

post '/authenticate_user' do
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:id] = user.id
    session[:user_name] = user.user_name
    session[:email] = user.email
    p session
    erb :user_index
  end
  erb :index #redirect to index if user/pass incorrect
end
