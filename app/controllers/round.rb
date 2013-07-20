post '/start_round' do
  deck = Deck.find_by_name(params[:deck_name])
  @card_array = deck.map(&:cards).dup

  erb :round
end