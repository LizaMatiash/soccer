require 'rails_helper'

RSpec.describe Team, type: :model do
  describe '.update_rating' do
    let(:blank_team) { create(:team) }
    let(:winning_team) { create(:team, :winning) }

    context 'completes blank team data without loses' do
      it 'winning situation' do
        blank_team.update_rating(5, 1)
        expect(blank_team.points).to eq 3
        expect(blank_team.scored_goals).to eq 5
        expect(blank_team.conceeded_goals).to eq 1
        expect(blank_team.wins).to eq 1
        expect(blank_team.draws).to eq 0
        expect(blank_team.loses).to eq 0
      end

      it 'losing situation' do
        blank_team.update_rating(1, 5)
        expect(blank_team.points).to eq 0
        expect(blank_team.scored_goals).to eq 1
        expect(blank_team.conceeded_goals).to eq 5
        expect(blank_team.wins).to eq 0
        expect(blank_team.draws).to eq 0
        expect(blank_team.loses).to eq 1
      end

      it 'draw situation' do
        blank_team.update_rating(5, 5)
        expect(blank_team.points).to eq 1
        expect(blank_team.scored_goals).to eq 5
        expect(blank_team.conceeded_goals).to eq 5
        expect(blank_team.wins).to eq 0
        expect(blank_team.draws).to eq 1
        expect(blank_team.loses).to eq 0
      end
    end

    context 'completes filled team data without loses' do
      it 'winning situation' do
        winning_team.update_rating(5, 1)
        expect(winning_team.points).to eq 13
        expect(winning_team.scored_goals).to eq 10
        expect(winning_team.conceeded_goals).to eq 2
        expect(winning_team.wins).to eq 4
        expect(winning_team.draws).to eq 1
        expect(winning_team.loses).to eq 1
      end

      it 'losing situation' do
        winning_team.update_rating(1, 5)
        expect(winning_team.points).to eq 10
        expect(winning_team.scored_goals).to eq 6
        expect(winning_team.conceeded_goals).to eq 6
        expect(winning_team.wins).to eq 3
        expect(winning_team.draws).to eq 1
        expect(winning_team.loses).to eq 2
      end

      it 'draw situation' do
        winning_team.update_rating(5, 5)
        expect(winning_team.points).to eq 11
        expect(winning_team.scored_goals).to eq 10
        expect(winning_team.conceeded_goals).to eq 6
        expect(winning_team.wins).to eq 3
        expect(winning_team.draws).to eq 2
        expect(winning_team.loses).to eq 1
      end
    end
  end
end
