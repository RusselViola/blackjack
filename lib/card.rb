class Card
  attr_reader :suit, :value
  def initialize(suit, value)
    @suit = suit
    @value = value
    is_face?
    is_ace?
  end

  def card_id
    "#{@suit}#{@value}"
  end

  def is_face?
    @value == "J" || @value == "K" || @value == "Q"
  end

  def is_ace?
    @value == 'A'
  end
end
