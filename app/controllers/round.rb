post '/start_round' do
  p "~~~~~~~~~~ #{params} ~~~~~~~~~~~~~"
  deck = Deck.find(params[:id])
  round = current_user.rounds.create(deck_id: deck.id)  
  @cards = deck.cards
  @first_card = @cards.first.definition

  erb :round
end