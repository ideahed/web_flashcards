get '/' do
  redirect '/user_dashboard' if logged_in?
  # Look in app/views/index.erb
  erb :index
end
