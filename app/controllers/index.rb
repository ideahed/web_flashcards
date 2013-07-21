get '/' do
  redirect '/user_dashboard' if logged_in?

  erb :index
end
