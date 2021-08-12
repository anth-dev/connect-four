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

end
