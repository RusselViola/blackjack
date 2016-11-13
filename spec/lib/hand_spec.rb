require 'pry'
require "spec_helper"
RSpec.describe Hand do
  let(:empty_hand) {Hand.new}
  # let(:nineteen_hand) {Hand.new}
  let(:deck) {Deck.new}
  describe Hand.new do
    it "should create an empty array" do
    handy = Hand.new
    expect(handy.hand.empty?).to eq(true)
    end
  end

  describe "#deal" do
    it "should shovel any number of cards into the hand array" do
      empty_hand.deal(deck.draw!(2))
      expect(empty_hand.hand.count).to eq(2)
    end
  end
  describe "#adjust_for_aces" do
    it "should reduce aces from 11 to 1 if 11 will go over 21" do
      empty_hand.hand << Card.new("♣︎", "A")
      empty_hand.hand << Card.new("♣︎", "A")
      expect(empty_hand.tally_score).to eq 12
    end
  end

  describe "#tally_score" do
    it "should have an initial score of zero" do
      expect(empty_hand.tally_score).to eq 0
    end
    it "should add jack and 9 to be 19" do
      empty_hand.hand << Card.new("♠︎", "J")
      empty_hand.hand << Card.new("♥︎", "9")
      expect(empty_hand.tally_score).to eq 19
    end
    it "should turn ace to 1 if 11 will go over 21" do
      empty_hand.hand << Card.new("♥︎","9")
      empty_hand.hand << Card.new("♥︎","9")
      empty_hand.hand << Card.new("♣︎","A")
      expect(empty_hand.tally_score).to eq 19
    end
    it "should turn ace to 11 if it won't go over 21" do
      empty_hand.hand << Card.new("♣︎","9")
      empty_hand.hand << Card.new("♣︎","A")
      expect(empty_hand.tally_score).to eq 20
    end
    it "should reduce aces to 1 if over 21" do
      empty_hand.hand << Card.new("♣︎", "A")
      empty_hand.hand << Card.new("♣︎", "A")
      expect(empty_hand.tally_score).to eq 12
    end
    it "should return 12 if given 10 and 2 aces" do
      empty_hand.hand << Card.new("♣︎", "A")
      empty_hand.hand << Card.new("♣︎", "A")
      empty_hand.hand << Card.new("♣︎", "K")
      expect(empty_hand.tally_score).to eq 12
    end
    # end
  end
end
# binding.pry
