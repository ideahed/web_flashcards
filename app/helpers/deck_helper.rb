helpers do
  
  def create_deck_with_cards_or_just_cards(params)
    deck_name = params[:deck][:name]
    deck = Deck.find_by_name(deck_name.downcase)

    unless deck.nil?
      params[:cards].each { |card| deck.cards.create(card) }
    else
      deck = Deck.create(params[:deck])
      params[:cards].each { |card| deck.cards.create(card) }
    end
  end
end