# Starts a round, randomly selects a card from the deck and returns it to round.erb to kick round off.
post '/start_round' do
  @deck = Deck.find(params[:id])
  @round = current_user.rounds.create(deck_id: @deck.id)
  @current_card = @deck.cards.sample
  erb :round
end

# Take in the user guess and compare it to the actual guess, return if they got it correct or not and the round id.
post '/guess' do
  card_id = params[:card_id]
  guess = params[:guess]
  @round = Round.find(params[:round_id])

  @correct = (guess.downcase == Card.find(card_id).term)
  @round.guesses.create(correct: @correct, card_id: card_id)

  content_type :json
  {correct: @correct, round_id: @round.id}.to_json
end

# Get the next card from the deck. If no cards left, return a redirect to user dashboard.
get '/round/:round_id/next_card' do 
  @round = Round.find(params[:round_id])

  @current_card = @round.deck.cards.where('id not in (?)', @round.guesses.pluck(:card_id)).sample

  content_type :json
  if @current_card.blank? 
    {num_cards: current_deck_size(@round), percentage: current_deck_guess_percentage(@round), redirect: '/user_dashboard'}.to_json
  else
    {definition: @current_card.definition, card_id: @current_card.id, round_id: @round.id}.to_json
  end
end

