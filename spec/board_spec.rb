# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/token'

describe Board do

  describe '#determine_display_value' do
    
      context 'when the space is empty' do
        subject(:board_for_testing_display) { described_class.new( [[black_token, black_token, nil, nil, nil, nil], [white_token, white_token, nil, nil, nil, nil], [white_token, nil, nil, nil, nil, nil], [black_token, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil]] ) }
        let(:black_token) { instance_double("Token", :owner => 'black') }
        let(:white_token) { instance_double("Token", :owner => 'white') }

        it 'should return a string containing two spaces' do
          expect(board_for_testing_display.determine_display_value(0, 2)).to eq('  ')
        end
      end

      context 'when the space contains a white token' do
        subject(:board_with_one_white_token) { described_class.new( [[white_token, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil]] ) }
        let(:white_token) { instance_double("Token", :owner => 'white') }

        it 'should return the unicode character of a white game token' do
          expect(board_with_one_white_token.determine_display_value(0, 0)).to eq("\u26AA")
        end
      end

      context 'when the space contains a black token' do
        subject(:board_with_one_black_token) { described_class.new( [[black_token, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil]] ) }
        let(:black_token) { instance_double("Token", :owner => 'black') }

        it 'should return the unicode character of a black game token' do
          expect(board_with_one_black_token.determine_display_value(0, 0)).to eq("\u26AB")
        end
      end
  end

  describe '#place_token' do
    context 'when the column is empty' do
      subject(:empty_board) { described_class.new }
      let(:white_token) { instance_double("Token", :owner => 'white') }

      it 'should place a white token at the bottom of the column' do
        empty_board.place_token(0, white_token)
        expect(empty_board.board[0][0]).to eq(white_token)
      end
    end

    context 'when the column is not empty' do
      subject(:board_with_one_black_token) { described_class.new( [[black_token, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil]] ) }
      let(:black_token) { instance_double("Token", :owner => 'black') }

      it 'should place the new token in the next nil spot' do
        board_with_one_black_token.place_token(0, black_token)
        expect(board_with_one_black_token.board[0][1]).to eq(black_token)
      end
    end
  end

end
