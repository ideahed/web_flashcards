post '/start_round' do
  deck = Deck.find(params[:id])
  @round = current_user.rounds.create(deck_id: deck.id)
  @current_card = deck.cards.sample
  erb :round
end

post '/guess' do
  card_id = params[:card_id]
  guess = params[:guess]
  @round = Round.find(params[:round_id])

  @correct = (guess.downcase == Card.find(card_id).term)
  @round.guesses.create(correct: @correct, card_id: card_id)
  @term = Card.find(card_id).term
  erb :round
end

get '/round/:round_id/next_card' do 
  @round = Round.find(params[:round_id])

  # currently, in each refresh the term updates but doesn't save anything
  @current_card = @round.deck.cards.where('id not in (?)', @round.guesses.pluck(:card_id)).sample

  if @current_card.nil? 
    redirect '/user_dashboard'
  else
    erb :round
  end
end
