# frozen_string_literal: true

class Game
  attr_reader :player

  def initialize(player = 'black', board = Board.new)
    @player = player
    @board = board
  end

  def won?
    return true if vertical_win?
    return true if ascending_diagonal_win?
    return true if descending_diagonal_win?
    return true if horizontal_win?

    false
  end

  def horizontal_win?
    @board.board.each_with_index { |column, board_index|
      column.each_index { |column_index|
        next if @board.board[board_index][column_index].nil?
        next if @board.board[board_index + 1][column_index].nil?
        next if @board.board[board_index + 2][column_index].nil?
        next if @board.board[board_index + 3][column_index].nil?

        return true if ( (@board.board[board_index][column_index].owner == @board.board[board_index + 1][column_index].owner) && (@board.board[board_index + 1][column_index].owner == @board.board[board_index + 2][column_index].owner) && (@board.board[board_index + 2][column_index].owner == @board.board[board_index + 3][column_index].owner) )
      }
    }
    false
  end

  def descending_diagonal_win?
    @board.board.each_with_index { |column, board_index|
      column.each_index { |column_index|
        next if @board.board[board_index][column_index].nil?
        next if @board.board[board_index + 1][column_index - 1].nil?
        next if @board.board[board_index + 2][column_index - 2].nil?
        next if @board.board[board_index + 3][column_index - 3].nil?

        return true if ( (@board.board[board_index][column_index].owner == @board.board[board_index + 1][column_index - 1].owner) && (@board.board[board_index + 1][column_index - 1].owner == @board.board[board_index + 2][column_index - 2].owner) && (@board.board[board_index + 2][column_index - 2].owner == @board.board[board_index + 3][column_index - 3].owner) )
      }
    }
    false
  end

  def ascending_diagonal_win?
    @board.board.each_with_index { |column, board_index|
      column.each_index { |column_index|
        next if @board.board[board_index][column_index].nil?
        next if @board.board[board_index + 1][column_index + 1].nil?
        next if @board.board[board_index + 2][column_index + 2].nil?
        next if @board.board[board_index + 3][column_index + 3].nil?

        return true if ( (@board.board[board_index][column_index].owner == @board.board[board_index + 1][column_index + 1].owner) && (@board.board[board_index + 1][column_index + 1].owner == @board.board[board_index + 2][column_index + 2].owner) && (@board.board[board_index + 2][column_index + 2].owner == @board.board[board_index + 3][column_index + 3].owner) )
      }
    }
    false
  end

  def vertical_win?
    @board.board.each_with_index { |column, board_index| 
      column.each_index { |column_index|
        next if @board.board[board_index][column_index].nil?
        next if @board.board[board_index][column_index + 1].nil?
        next if @board.board[board_index][column_index + 2].nil?
        next if @board.board[board_index][column_index + 3].nil?

        return true if ( (@board.board[board_index][column_index].owner == @board.board[board_index][column_index + 1].owner) && (@board.board[board_index][column_index + 1].owner == @board.board[board_index][column_index + 2].owner) && (@board.board[board_index][column_index + 2].owner == @board.board[board_index][column_index + 3].owner) )
      }
    }
    false
  end

  def draw?
    return true if @board.board.all? { |column| column.none?(&:nil?) }

    false
  end

  def swap_players!
    @player == 'black' ? @player = 'white' : @player = 'black'
  end

  def take_turn
    @board.display_board
    puts "Go, #{@player}! Enter a number 0-6."
    print ">"
    handle_input(gets.chomp)
    @board.display_board

    # call a method to display the winner if the game has been won
    @board.display_win_message if @board.game_won?

    # call a method to display draw message if the game is a draw
    
    swap_players!
    take_turn
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

  def display_win_message
    puts "Congratulations, #{game_winner}! You are the winner!"
  end

  def return_winner
    
  end
end
