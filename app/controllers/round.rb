post '/start_round' do
  deck = Deck.find(params[:id])
  @round = current_user.rounds.create(deck_id: deck.id)  
  @first_card = deck.cards.first

  erb :round
end

get '/next_card' do

end

post '/guess' do
  # check term
  card_id = params[:card_id]
  round_id = params[:round_id]
  guess = params[:guess]

  @correct = (guess.downcase == Card.find(card_id).term)
  Guess.create(correct: @correct, card_id: card_id, round_id: round_id)
  @definition = Card.find(card_id).definition;
  erb :round
end

get '/next_card' do 
  erb :round
end