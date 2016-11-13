require "spec_helper"
RSpec.describe Blackjack do
  let(:blackjack) {Blackjack.new}
  let(:test_deck) {Deck.new}

  describe Blackjack.new do
    it "should produce a deck of 52 cards" do
      expect(test_deck.deck.count).to eq 52
    end
    it "should produce an empty hand for a player" do
      expect(blackjack.player.hand.empty?).to eq true
    end
    it "should produce an empty hand for a computer" do
    expect(blackjack.computer.hand.empty?).to eq true
    end
  end

  describe "initial_deal" do
    it "deals 2 cards to the player" do
      blackjack.initial_deal
      expect(blackjack.computer.hand.length).to eq 2
    end
    it "deals 2 cards to the computer" do
      blackjack.initial_deal
      expect(blackjack.player.hand.length).to eq 2
    end
  end


  # describe "#begin" do
  #   it "should prompt the player to begin" do
  #     expect(blackjack.begin).to eq("Would you like to deal?")
  #   end
  # end
end
