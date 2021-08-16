# frozen_string_literal: true

class Board
  attr_reader :board

  def initialize(board = Array.new(7) { Array.new(6, nil ) } )
    @board = board
  end

  def game_won?
    return true if vertical_win?
    return true if ascending_diagonal_win?
    return true if descending_diagonal_win?
    return true if horizontal_win?

    false
  end

  def horizontal_win?
    @board.each_with_index { |column, board_index|
      column.each_index { |column_index|
        next if @board[board_index][column_index].nil?
        next if @board[board_index + 1][column_index].nil?
        next if @board[board_index + 2][column_index].nil?
        next if @board[board_index + 3][column_index].nil?

        return true if ( (@board[board_index][column_index].owner == @board[board_index + 1][column_index].owner) && (@board[board_index + 1][column_index].owner == @board[board_index + 2][column_index].owner) && (@board[board_index + 2][column_index].owner == @board[board_index + 3][column_index].owner) )
      }
    }
    false
  end

  def descending_diagonal_win?
    @board.each_with_index { |column, board_index|
      column.each_index { |column_index|
        next if @board[board_index][column_index].nil?
        next if @board[board_index + 1][column_index - 1].nil?
        next if @board[board_index + 2][column_index - 2].nil?
        next if @board[board_index + 3][column_index - 3].nil?

        return true if ( (@board[board_index][column_index].owner == @board[board_index + 1][column_index - 1].owner) && (@board[board_index + 1][column_index - 1].owner == @board[board_index + 2][column_index - 2].owner) && (@board[board_index + 2][column_index - 2].owner == @board[board_index + 3][column_index - 3].owner) )
      }
    }
    false
  end

  def ascending_diagonal_win?
    @board.each_with_index { |column, board_index|
      column.each_index { |column_index|
        next if @board[board_index][column_index].nil?
        next if @board[board_index + 1][column_index + 1].nil?
        next if @board[board_index + 2][column_index + 2].nil?
        next if @board[board_index + 3][column_index + 3].nil?

        return true if ( (@board[board_index][column_index].owner == @board[board_index + 1][column_index + 1].owner) && (@board[board_index + 1][column_index + 1].owner == @board[board_index + 2][column_index + 2].owner) && (@board[board_index + 2][column_index + 2].owner == @board[board_index + 3][column_index + 3].owner) )
      }
    }
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

  def game_draw?
    return true if @board.all? { |column| column.none?(&:nil?) }

    false
  end

  def display_board
    system 'clear'

    puts %(
      |0|1|2|3|4|5|6|
      ---------------
      |#{determine_display_value(0, 5)}|#{determine_display_value(1, 5)}|#{determine_display_value(2, 5)}|#{determine_display_value(3, 5)}|#{determine_display_value(4, 5)}|#{determine_display_value(5, 5)}|#{determine_display_value(6, 5)}|
      |#{determine_display_value(0 , 4)}|#{determine_display_value(1 , 4)}|#{determine_display_value(2 , 4)}|#{determine_display_value(3 , 4)}|#{determine_display_value(4 , 4)}|#{determine_display_value(5 , 4)}|#{determine_display_value(6 , 4)}|
      |#{determine_display_value(0 , 3)}|#{determine_display_value(1 , 3)}|#{determine_display_value(2 , 3)}|#{determine_display_value(3, 3)}|#{determine_display_value(4 , 3)}|#{determine_display_value(5 , 3)}|#{determine_display_value(6 , 3)}|
      |#{determine_display_value(0, 2)}|#{determine_display_value(1, 2)}|#{determine_display_value(2, 2)}|#{determine_display_value(3, 2)}|#{determine_display_value(4, 2)}|#{determine_display_value(5, 2)}|#{determine_display_value(6, 2)}|
      |#{determine_display_value(0, 1)}|#{determine_display_value(1, 1)}|#{determine_display_value(2, 1)}|#{determine_display_value(3, 1)}|#{determine_display_value(4, 1)}|#{determine_display_value(5, 1)}|#{determine_display_value(6, 1)}|
      |#{determine_display_value(0, 0)}|#{determine_display_value(1, 0)}|#{determine_display_value(2, 0)}|#{determine_display_value(3, 0)}|#{determine_display_value(4, 0)}|#{determine_display_value(5, 0)}|#{determine_display_value(6, 0)}|
      ---------------
    )
  end

  def determine_display_value(board_index, space_index)
    return ' ' if @board[board_index][space_index].nil?

    return "\u26AA" if @board[board_index][space_index].owner == 'white'

    return "\u26AB" if @board[board_index][space_index].owner == 'black'
  
  end

  def place_token(board_index, token)
    index_of_first_nil = @board[board_index].find_index(&:nil?)
    @board[board_index][index_of_first_nil] = token
  end
end
