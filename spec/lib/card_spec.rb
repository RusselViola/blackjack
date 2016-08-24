require "spec_helper"

RSpec.describe Card do
  let(:card_1) {Card.new("♠︎", "A")}
  let(:card_2) {Card.new("♣︎", "K")}
  let(:card_3) {Card.new("♥︎", 9)}

  describe "is_ace?" do
    it "the card is has a value of 'A' it will return true" do
      expect(card.value).to eq("A")
      expect(card_2.value).to eq("K")
      expect(card_3.value).to eq(9)
    end
  end
end
