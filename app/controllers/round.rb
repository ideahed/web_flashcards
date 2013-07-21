post '/start_round' do
  deck = Deck.find(params[:id])
  @round = current_user.rounds.create(deck_id: deck.id)
  session[:deck_id] = deck.id
  session[:round_id] = @round.id
  @current_card = deck.cards.first

  erb :round
end

post '/guess' do
  # check term
  card_id = params[:card_id]
  round_id = session[:round_id]
  guess = params[:guess]

  @correct = (guess.downcase == Card.find(card_id).term)
  Guess.create(correct: @correct, card_id: card_id, round_id: round_id)
  @term = Card.find(card_id).term
  erb :round
end

get '/next_card' do 
  guesses = Guess.where(round_id: session[:round_id])
  deck = Deck.where(id: session[:deck_id])
  
  deck_card_id_array = deck[0].cards.map(&:id)
  guess_card_id_array = guesses.map(&:card_id)
  remaining_cards_to_guess = deck_card_id_array - guess_card_id_array
  next_card_id = remaining_cards_to_guess.first  
  if next_card_id.nil? 
    redirect '/user_dashboard'
  else
    @current_card = deck[0].cards.find(next_card_id)
    return erb :round
  end

  # get '/show_stats'

  # end

end