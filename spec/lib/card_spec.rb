require "spec_helper"

RSpec.describe Card do
  let(:card_1) {Card.new("♠︎", "A")}
  let(:card_2) {Card.new("♣︎", "K")}
  let(:card_3) {Card.new("♥︎", 9)}

  describe "is_ace?" do
    it "the card is has a value of 'A' it will return true" do
      expect(card_1.is_ace?).to eq(true)
      expect(card_2.is_ace?).to eq(false)
      expect(card_3.is_ace?).to eq(false)
    end
  end
  describe "is face?" do
    it "should return a value of true if the card is 'K', 'J', or 'Q'" do
      expect(card_2.is_face?).to eq(true)
      expect(card_1.is_face?).to eq(false)
      expect(card_3.is_face?).to eq(false)
    end
  end
end
# expect(card_2.value).to eq("K")
# expect(card_3.value).to eq(9)
