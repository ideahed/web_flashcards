post '/create_user' do
  p params
  user = User.new(user_name: params[:user_name], email: params[:email])
  user.password = params[:password]
  user.save
end
