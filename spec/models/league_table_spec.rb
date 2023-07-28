require 'rails_helper'

RSpec.describe LeagueTable, type: :model do
  describe '.set_match' do
    context 'converts string into teams and scores' do
      it 'winning situation' do
        league_table = LeagueTable.new
        league_table.set_match('A A 5 - 6 B B')
        expect(league_table.home_team.name).to eq 'A A'
        expect(league_table.away_team.name).to eq 'B B'
        expect(league_table.home_team_score).to eq 5
        expect(league_table.away_team_score).to eq 6
      end
    end
  end

  describe '.get_points' do
    let(:random_team) { create(:team) }
    let(:winning_team) { create(:team, :winning) }
    let(:lossing_team) { create(:team, :lossing) }
    let(:league_table) { create(:league_table, home_team: winning_team, away_team: lossing_team) }

    context 'gets team points' do
      it 'winning team' do
        expect(league_table.get_points(winning_team.name)).to eq 10
      end

      it 'losing team' do
        expect(league_table.get_points(lossing_team.name)).to eq 4
      end

      it 'no name team' do
        expect(league_table.get_points(random_team.name)).to eq 0
      end
    end
  end

  describe '.get_goals_for' do
    let(:random_team) { create(:team) }
    let(:winning_team) { create(:team, :winning) }
    let(:lossing_team) { create(:team, :lossing) }
    let(:league_table) { create(:league_table, home_team: winning_team, away_team: lossing_team) }

    context 'gets team scored goals' do
      it 'winning team' do
        expect(league_table.get_goals_for(winning_team.name)).to eq 5
      end

      it 'losing team' do
        expect(league_table.get_goals_for(lossing_team.name)).to eq 1
      end

      it 'no name team' do
        expect(league_table.get_goals_for(random_team.name)).to eq 0
      end
    end
  end

  describe '.get_goals_against' do
    let(:random_team) { create(:team) }
    let(:winning_team) { create(:team, :winning) }
    let(:lossing_team) { create(:team, :lossing) }
    let(:league_table) { create(:league_table, home_team: winning_team, away_team: lossing_team) }

    context 'gets team lost goals' do
      it 'winning team' do
        expect(league_table.get_goals_against(winning_team.name)).to eq 1
      end

      it 'losing team' do
        expect(league_table.get_goals_against(lossing_team.name)).to eq 5
      end

      it 'no name team' do
        expect(league_table.get_goals_against(random_team.name)).to eq 0
      end
    end
  end

  describe '.get_goal_difference' do
    let(:random_team) { create(:team) }
    let(:winning_team) { create(:team, :winning) }
    let(:lossing_team) { create(:team, :lossing) }
    let(:league_table) { create(:league_table, home_team: winning_team, away_team: lossing_team) }

    context 'gets team difference of goals' do
      it 'winning team' do
        expect(league_table.get_goal_difference(winning_team.name)).to eq 4
      end

      it 'losing team' do
        expect(league_table.get_goal_difference(lossing_team.name)).to eq(-4)
      end

      it 'no name team' do
        expect(league_table.get_goal_difference(random_team.name)).to eq 0
      end
    end
  end

  describe '.get_wins' do
    let(:random_team) { create(:team) }
    let(:winning_team) { create(:team, :winning) }
    let(:lossing_team) { create(:team, :lossing) }
    let(:league_table) { create(:league_table, home_team: winning_team, away_team: lossing_team) }

    context 'gets teams` wins' do
      it 'winning team' do
        expect(league_table.get_wins(winning_team.name)).to eq 3
      end

      it 'losing team' do
        expect(league_table.get_wins(lossing_team.name)).to eq 1
      end

      it 'no name team' do
        expect(league_table.get_wins(random_team.name)).to eq 0
      end
    end
  end

  describe '.get_draws' do
    let(:random_team) { create(:team) }
    let(:winning_team) { create(:team, :winning) }
    let(:lossing_team) { create(:team, :lossing) }
    let(:league_table) { create(:league_table, home_team: winning_team, away_team: lossing_team) }

    context 'gets teams` draws' do
      it 'winning team' do
        expect(league_table.get_draws(winning_team.name)).to eq 1
      end

      it 'losing team' do
        expect(league_table.get_draws(lossing_team.name)).to eq 1
      end

      it 'no name team' do
        expect(league_table.get_draws(random_team.name)).to eq 0
      end
    end
  end

  describe '.get_losses' do
    let(:random_team) { create(:team) }
    let(:winning_team) { create(:team, :winning) }
    let(:lossing_team) { create(:team, :lossing) }
    let(:league_table) { create(:league_table, home_team: winning_team, away_team: lossing_team) }

    context 'gets teams` losses' do
      it 'winning team' do
        expect(league_table.get_losses(winning_team.name)).to eq 1
      end

      it 'losing team' do
        expect(league_table.get_losses(lossing_team.name)).to eq 3
      end

      it 'no name team' do
        expect(league_table.get_losses(random_team.name)).to eq 0
      end
    end
  end
end
