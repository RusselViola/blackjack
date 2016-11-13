require 'pry'
# require_relative "deck"
class Hand
  attr_accessor :hand, :score, :aces
  def initialize
    @hand = []
  end

  def show_hand
    puts "Your hand is:"
    output = ""
    @hand.each do |card|
      output += "#{card.suit}#{card.value}\n"
    end
    puts output
  end

  def dealer_hidden
    puts "Dealer shows:\n#{@hand[0].suit}#{@hand[0].value}"
  end

  def dealer_reveal
    puts "Dealer shows hand:"
    output = ""
    @hand.each do |card|
      output += "#{card.suit}#{card.value}\n"
    end
    puts output
  end

  def deal(cards)
    @hand << cards
    @hand.flatten!
  end

  def tally_score
    @aces = 0
    @score = 0
    @hand.each do |card|
      # binding.pry
      if card.is_face?
        @score += 10
      elsif card.is_ace?
        @aces += 1
        @score += 11
      else
        @score += card.value.to_i
      end
    end
    adjust_for_aces
  end

  def adjust_for_aces
    while @score > 21 && @aces > 0
      @score -= 10
      @aces -= 1
      break if @score < 21
    end
    @score
  end
end
