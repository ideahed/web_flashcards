get '/user_dashboard' do
  @decks = Deck.all

  erb :user_dashboard
end