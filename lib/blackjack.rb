require 'pry'
require_relative 'hand'
require_relative 'deck'
require_relative 'card'

class Blackjack
  attr_reader :deck, :player, :computer, :user_input
  def initialize
    @deck = deck
    @player = player
    @computer = computer
    @user_input = user_input
  end

  def begin_prompt
    @deck = Deck.new
    @player = Hand.new
    @computer = Hand.new
    puts "Would you like to begin? Y/N ?"
    valid_user_y_n
    if @user_input == 'y'
      initial_deal
    else
      puts "Fine then! Maybe don't start up a game if you don't want to play next time."
      abort
    end
    puts @computer.dealer_hidden
    puts @player.show_hand
    puts "You're hand: #{@player.tally_score}"
    hit_or_stay
  end

  def hit_or_stay
    puts "Would you like to hit or stay? H/S"
    valid_user_h_s
    until @user_input == 's'
    player_hit
    # puts @computer.dealer_hidden
    # puts @player.show_hand
    blackjack_or_bust
    puts "You're hand: #{@player.tally_score}"
    puts "Would you like to hit or stay? H/S"
    valid_user_h_s
    end
    if @player.score > 21
      blackjack_or_bust
    end
    dealer_turn
  end

  def blackjack_or_bust
    @computer.dealer_reveal
    puts "Dealer's hand: #{@computer.tally_score}"
    @player.show_hand
    puts"You're hand: #{@player.tally_score}"
    if @player.tally_score > 21
      puts "Bust! House wins! You kind-of suck at this. Aren't you a programmer?"
      play_again?
    elsif @player.tally_score == 21
      puts "BLACKJACK. You defeated a simple machine. Congrats!"
      play_again?
    end
  end
  def dealer_blackjack_or_bust
    @computer.dealer_reveal
    puts "Dealer's hand: #{@computer.tally_score}"
    @player.show_hand
    puts"You're hand: #{@player.tally_score}"
    if @computer.tally_score > 21
      puts "BLACKJACK. You defeated a simple machine. Congrats!"
      play_again?
    elsif @computer.tally_score == 21
      puts "Game over man!! You should re-think your life decisions."
      play_again?
    end
  end

  def dealer_turn
    @computer.dealer_hidden
    puts "Dealer's hand: #{@computer.tally_score}"
    while @computer.tally_score < 17 do
      dealer_hit
      puts "Dealer dealt #{@computer.hand[-1].card_id}"
      @dealer_reveal
      puts "Dealer's hand: #{@computer.tally_score}"
    end
    if @computer.tally_score >= 21
      dealer_blackjack_or_bust
    else
      calculate_winner
    end
  end


  def play_again?
    puts "Would you like to try your luck again? Y/N ?"
    valid_user_y_n
    if @user_input == 'n'
      puts "Better luck next time!"
      abort
    else
    begin_prompt
    end
  end

  def initial_deal
    @player.deal(@deck.draw!(2))
    @computer.deal(@deck.draw!(2))
  end

  def player_hit
    @player.deal(@deck.draw!(1))
  end

  def dealer_hit
    @computer.deal(@deck.draw!(1))
  end

  def calculate_winner
    if @computer.tally_score >= @player.tally_score
      puts "Dealer wins with #{@computer.tally_score}. You lose!!!"
    else
      puts "You win with #{@computer.tally_score}. Congrats. You have beaten a simple machine."
    end
    play_again?
  end


  def valid_user_y_n
    @user_input = gets.chomp.downcase
    until @user_input == 'y' || @user_input == 'n' do
      puts "Please select Y/N"
      @user_input = gets.chomp
    end
  end
  def valid_user_h_s
    @user_input = gets.chomp.downcase
    until @user_input == 'h' || @user_input == 's' do
      puts "Please select H/S"
      @user_input = gets.chomp
    end
  end
end
