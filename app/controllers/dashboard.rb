get '/user_dashboard' do
  @decks = Deck.all

  erb :user_dashboard
end

# post '/user_dashboard' do
#   deck = Deck.find_by_name(params[:deck_name])

#   redirect "/start_round"
# end