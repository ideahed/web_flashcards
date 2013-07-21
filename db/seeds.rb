# insert the cards into a deck
module FileParsing

  def self.read_file
    file_data = []
    File.open('flashcard_seed_data.txt', "r") do |object|
      while row = object.gets
        next if row.nil?
        row = row.chomp
        file_data << row
      end
    end 
    file_data
  end

  def self.parse_data(file_data)
    file_data.reject {|row| row == " " }.each_slice(2).map(&:reverse)
  end
end

module PretendDeck
  def self.deck_name(name)
    deck = Deck.create(name: name)
  end
end

module SeedDB
  include FileParsing
  include PretendDeck

  def self.fill_deck_with_csv_data
    raw_file_array = FileParsing.read_file
    deck = Deck.create(name: "technical terms")
    FileParsing.parse_data(raw_file_array).each do |card_array|
      deck.cards << Card.create(term: card_array[0], definition: card_array[1])
    end
  end

  def self.fill_deck
    deck = PretendDeck.deck_name("english_to_spanish")
    # deck = Deck.find(2)
    card_array = [["hi", "hola"], ["I'm hungry", "tengo hambre"], ["this is fun", "esto esta divertido"]]
    card_array.each do |card|  
      deck.cards << Card.create(term: card[0], definition: card[1])
    end
  end
end