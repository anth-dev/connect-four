# frozen_string_literal: true

class Game

  def initialize(player = 'black')
    @player = player
    @board = Board.new
  end

end
