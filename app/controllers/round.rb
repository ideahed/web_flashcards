post '/start_round' do
  p "~~~~~~~~~~ #{params} ~~~~~~~~~~~~~"
  deck = Deck.find(params[:id])
  @round = current_user.rounds.create(deck_id: deck.id)  
  @first_cards = deck.cards.first

  erb :round
end

post '/guess' do

end