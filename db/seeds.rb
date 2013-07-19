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

  def self.fill_deck
    raw_file_array = self.read_file
    deck = Deck.create(name: "technical terms")
    # p "this is the deck #{deck}"
    self.parse_data(raw_file_array).each do |card_array|
      deck.cards << Card.create(term: card_array[0], definition: card_array[1])
    end
  end
end