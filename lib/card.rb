class Card
  attr_reader :suit, :value
  def initialize(suit, value)
    @suit = suit
    @value = value
    is_face?
    is_ace?
  end

  def is_face?
    # face = ['J', 'K', 'Q']
    # face.include?(@value)
    @value == "J" || @value == "K" || @value == "Q"
  end

  def is_ace?
    @value == 'A'
  end
end
