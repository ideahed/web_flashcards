helpers do

  def player_rounds
    Round.where(user_id: User.find(current_user))
  end

  def current_deck(round)
     Deck.find(round.deck_id)
  end

  def current_deck_name(round)
    current_deck(round).name
  end

  def current_deck_size(round)
    Card.where(deck_id: current_deck(round).id).size
  end

  def current_deck_correct_guesses(round)
    round.guesses.where(correct: 1).size
  end

  def current_deck_guess_percentage(round)
    if current_deck_correct_guesses(round) == 0
      return 0
    else
      current_deck_size(round) / current_deck_correct_guesses(round)
    end
  end
  
end