require 'pry'
require_relative "deck"
require_relative "hand"

current_deck = Deck.new
#would you like to deal? y/n
player = Hand.new
computer = Hand.new
player.deal(current_deck.draw!(2))
computer.deal(current_deck.draw!(2))
puts player.tally_score
# binding.pry

# Your code here...
#game mechanics like "hit" "pass"
#score talley #use a method from hand
#wins
