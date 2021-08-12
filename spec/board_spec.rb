# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/token'

describe Board do

  describe '#game_won?' do
    
    context 'when the board is empty' do
      subject(:empty_board) { described_class.new }
      it 'should return false' do
        expect(empty_board).not_to be_game_won
      end
    end

    context 'when a player has three in a row vertically' do
      subject(:board_with_three_vertically) { described_class.new( [[nil, nil, nil, nil, nil, nil], [nil, nil, white_token, white_token, white_token, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil]] ) }
      let(:white_token) { instance_double("Token", :owner => 'white') }
      it 'should return false' do
        expect(board_with_three_vertically).not_to be_game_won
      end
    end

    context 'when there is a vertical win' do
      subject(:board_with_vertical_win) { described_class.new( [[nil, nil, nil, nil, nil, nil], [nil, nil, black_token, black_token, black_token, black_token], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil]] ) }
      let(:black_token) { instance_double("Token", :owner => 'black') }
      it 'should return true' do
        expect(board_with_vertical_win).to be_game_won
      end
    end
  end
end
