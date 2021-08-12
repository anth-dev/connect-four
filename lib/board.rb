# frozen_string_literal: true

class Board
  attr_reader :board

  def initialize(board = Array.new(7) { Array.new(6, nil ) } )
    @board = board
  end

  def game_won?
    return true if vertical_win?
    false
  end

  def vertical_win?
    @board.each_with_index { |column, board_index| 
      column.each_index { |column_index|
        next if @board[board_index][column_index].nil?
        next if @board[board_index][column_index + 1].nil?
        next if @board[board_index][column_index + 2].nil?
        next if @board[board_index][column_index + 3].nil?
        return true if ( (@board[board_index][column_index].owner == @board[board_index][column_index + 1].owner) && (@board[board_index][column_index + 1].owner == @board[board_index][column_index + 2].owner) && (@board[board_index][column_index + 2].owner == @board[board_index][column_index + 3].owner) )
      }
    }
    false
  end
end
