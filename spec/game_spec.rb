# frozen_string_literal: true

require_relative '../lib/game'
require_relative '../lib/board'

describe Game do

    describe '#swap_players!' do

      context 'when black is the current player' do
        subject(:game_with_player_black) { described_class.new }

        it 'should change player to white' do
          game_with_player_black.swap_players!
          expect(game_with_player_black.player).to eq('white')
        end
      end

      context 'when white is the current player' do
        subject(:game_with_player_white) { described_class.new('white') }

        it 'should change player to black' do
          game_with_player_white.swap_players!
          expect(game_with_player_white.player).to eq('black')
        end
      end
    end

    describe '#check_for_winner' do
    
      context 'when the board is empty' do
        subject(:game_with_empty_board) { described_class.new }
  
        it 'should return false' do
          expect(game_with_empty_board.check_for_winner).to eq(false)
        end
      end
  
      context 'when a player has three in a row vertically' do
        subject(:game_with_three_vertically) { described_class.new( 'black', Board.new([[nil, nil, nil, nil, nil, nil], [white_token, white_token, white_token, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil]]) ) }
        let(:white_token) { instance_double("Token", :owner => 'white') }
  
        it 'should return false' do
          expect(game_with_three_vertically.check_for_winner).to eq(false)
        end
      end
  
      context 'when black has a vertical win' do
        subject(:game_with_vertical_win) { described_class.new( 'black', Board.new([[nil, nil, nil, nil, nil, nil], [black_token, black_token, black_token, black_token, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil]]) ) }
        let(:black_token) { instance_double("Token", :owner => 'black') }
  
        it 'should return the black' do
          expect(game_with_vertical_win.check_for_winner).to eq('black')
        end
      end
  
      context 'when black has an ascending diagonal win' do
        subject(:game_with_ascending_diagonal_win) { described_class.new( 'black', Board.new([[black_token, nil, nil, nil, nil, nil], [white_token, black_token, nil, nil, nil, nil], [white_token, white_token, black_token, nil, nil, nil], [white_token, white_token, white_token, black_token, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil]]) ) }
        let(:black_token) { instance_double("Token", :owner => 'black') }
        let(:white_token) { instance_double("Token", :owner => 'white') }
  
        it 'should return black' do
          expect(game_with_ascending_diagonal_win.check_for_winner).to eq('black')
        end
      end
  
      context 'when a player has 3 in a row ascending diagonally' do
        subject(:game_with_three_ascending_diagonally) { described_class.new( 'black', Board.new([[black_token, nil, nil, nil, nil, nil], [white_token, black_token, nil, nil, nil, nil], [white_token, white_token, black_token, nil, nil, nil], [white_token, white_token, white_token, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil]]) ) }
        let(:black_token) { instance_double("Token", :owner => 'black') }
        let(:white_token) { instance_double("Token", :owner => 'white') }
  
        it 'should return false' do
          expect(game_with_three_ascending_diagonally.check_for_winner).to eq(false)
        end
      end
  
      context 'when a player has 3 in a row descending diagonally' do
        subject(:game_with_three_descending_diagonally) { described_class.new( 'black', Board.new([[black_token, black_token, black_token, white_token, nil, nil], [black_token, black_token, white_token, nil, nil, nil], [black_token, white_token, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil]]) ) }
        let(:black_token) { instance_double("Token", :owner => 'black') }
        let(:white_token) { instance_double("Token", :owner => 'white') }
  
        it 'should return false' do
          expect(game_with_three_descending_diagonally.check_for_winner).to eq(false)
        end
      end
  
      context 'when white has a descending diagonal win' do
        subject(:game_with_descending_diagonal_win) { described_class.new( 'black', Board.new([[black_token, black_token, black_token, white_token, nil, nil], [black_token, black_token, white_token, nil, nil, nil], [black_token, white_token, nil, nil, nil, nil], [white_token, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil]]) ) }
        let(:black_token) { instance_double("Token", :owner => 'black') }
        let(:white_token) { instance_double("Token", :owner => 'white') }
  
        it 'should return white' do
          expect(game_with_descending_diagonal_win.check_for_winner).to eq('white')
        end
      end
  
      context 'when black has a horizontal win' do
        subject(:game_with_horizontal_win) { described_class.new( 'black', Board.new([[black_token, nil, nil, nil, nil, nil], [black_token, nil, nil, nil, nil, nil], [black_token, nil, nil, nil, nil, nil], [black_token, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil]]) ) }
        let(:black_token) { instance_double("Token", :owner => 'black') }
  
        it 'should return true' do
          expect(game_with_horizontal_win.check_for_winner).to eq('black')
        end
      end
    end
  
    describe '#draw?' do
  
      context 'when the game is not a draw' do
        subject(:game_with_no_draw) { described_class.new( 'black', Board.new([[black_token, black_token, nil, nil, nil, nil], [white_token, white_token, nil, nil, nil, nil], [white_token, nil, nil, nil, nil, nil], [black_token, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil], [nil, nil, nil, nil, nil, nil]]) ) }
        let(:black_token) { instance_double("Token", :owner => 'black') }
        let(:white_token) { instance_double("Token", :owner => 'white') }
  
        it 'should return false' do
          expect(game_with_no_draw).not_to be_draw
        end
      end
  
      context 'when the game is a draw' do
        subject(:game_with_a_draw) { described_class.new( 'black', Board.new([[white_token, white_token, black_token, white_token, black_token, white_token], [white_token, white_token, black_token, white_token, black_token, white_token], [black_token, black_token, white_token, black_token, black_token, white_token], [black_token, black_token, white_token, black_token, white_token, black_token], [white_token, white_token, black_token, black_token, black_token, white_token], [black_token, white_token, black_token, white_token, black_token, white_token], [white_token, black_token, white_token, black_token, black_token, white_token]]) ) }
        let(:black_token) { instance_double("Token", :owner => 'black') }
        let(:white_token) { instance_double("Token", :owner => 'white') }
  
        it 'should return true' do
          expect(game_with_a_draw).to be_draw
        end
      end
    end
end
