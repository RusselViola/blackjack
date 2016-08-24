require 'pry'
require_relative "card"
# require_relative "deck"
class Hand
  attr_accessor :hand, :score
  def initialize
    @hand = []
  end

  def tally_score
    @score = 0
    @hand.each do |card|
      # binding.pry
      if card.is_face?
        @score += 10
    elsif card.is_ace?
        if (@score + 11) > 21
          @score += 1
        else
          @score += 11
        end
      else
        @score += card.value
      end
    end
    @score
  end

  def deal(cards)
    @hand << cards
    @hand.flatten!
  end

end
