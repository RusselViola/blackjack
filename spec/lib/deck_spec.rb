require "spec_helper"

RSpec.describe Deck do
  let(:blackjack) {Deck.new}
  # Your tests here
  describe "Deck.new" do
    it "should generate a deck of 52 cards" do
      expect(blackjack.deck.count).to eq(52)
    end
  end

  describe "draw!" do
    it "should remove 1 card per instance of .draw!" do
      blackjack.draw!(1)
      expect(blackjack.deck.count).to eq(51)
      blackjack.draw!(2)
      expect(blackjack.deck.count).to eq(49)
    end
  end
end

RSpec.describe Card do
  describe "Card.new" do
    it "should be a 5 of clubs" do
      card = Card.new("♣", 5)
      expect(card.suit).to eq("♣")
      expect(card.value).to eq(5)
    end
  end
end
