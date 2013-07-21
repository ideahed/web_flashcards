enable :sessions

post '/create_user' do
  user = User.new(user_name: params[:user_name], email: params[:email])
  user.password = params[:password]
  user.save
  p start_session(user)
  redirect '/user_dashboard'
end

post '/authenticate_user' do
  user = User.authenticate(params[:email], params[:password])
  p user
  if user
    start_session(user)
    redirect '/user_dashboard'
  end
  erb :index #redirect to index if user/pass incorrect
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/user_dashboard' do 
  @decks = Deck.all

  erb :user_dashboard
end

get '/new_deck'do

  erb :create_deck
end

post '/create_deck' do
  deck = Deck.create(params[:deck])
  params[:cards].each { |card| deck.cards.create(card) }
  
  redirect '/user_dashboard'  
end
