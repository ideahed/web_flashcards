require 'spec_helper'

describe Deck do  
  before do
    @deck = Deck.new
  end

  describe "validations" do 
    it 'should validate that a deck name saves' do
      @deck.name = "math"
      @deck.save!
      @deck.valid? == true
    end
  end
end