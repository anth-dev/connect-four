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
end
