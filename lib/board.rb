# frozen_string_literal: true

class Board
  attr_reader :board

  def initialize(board = Array.new(7) { Array.new(6, nil ) } )
    @board = board
  end

  def game_won?
    return true if
    false
  end
end
