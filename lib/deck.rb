# require 'pry'
require_relative 'card'
class Deck
  # Your code here
  SUITS = ['♦', '♣', '♠', '♥']
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

  attr_reader :deck
  def initialize
    @deck = []
    SUITS.each do |suit|
      VALUES.each do |value|
        @deck << Card.new(suit, value)
      end
    end
    @deck.shuffle!
  end

  def draw!(num)
    @deck.pop(num)
  end
end

class Card
  attr_reader :suit, :value
  def initialize(suit, value)
    @suit = suit
    @value = value
  end


  def is_face?
    @value == 'J' || @value == 'J' || @value == 'Q'
  end

  def is_ace?
    @value == 'A'
  end
end

# blackjack = Deck.new
# binding.pry
