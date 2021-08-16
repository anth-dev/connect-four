# frozen_string_literal: true

class Game
  attr_reader :player

  def initialize(player = 'black')
    @player = player
    @board = Board.new
  end

  def swap_players!
    @player == 'black' ? @player = 'white' : @player = 'black'
  end

  def take_turn
    @board.display_board
    puts "Go, #{@player}! Enter a number 0-6."
    print ">"
    handle_input(gets.chomp)
  end

  def handle_input(input)
    case input
    when '0'
      @board.board[0].any?(&:nil?) ? @board.place_token(0, Token.new(@player)) : take_turn
    when '1'
      @board.board[1].any?(&:nil?) ? @board.place_token(1, Token.new(@player)) : take_turn
    when '2'
      @board.board[2].any?(&:nil?) ? @board.place_token(2, Token.new(@player)) : take_turn
    when '3'
      @board.board[3].any?(&:nil?) ? @board.place_token(3, Token.new(@player)) : take_turn
    when '4'
      @board.board[4].any?(&:nil?) ? @board.place_token(4, Token.new(@player)) : take_turn
    when '5'
      @board.board[5].any?(&:nil?) ? @board.place_token(5, Token.new(@player)) : take_turn
    when '6'
      @board.board[6].any?(&:nil?) ? @board.place_token(6, Token.new(@player)) : take_turn
    else
      take_turn
    end

  end
end
