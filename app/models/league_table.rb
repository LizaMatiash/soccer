class LeagueTable < ApplicationRecord
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'

  # it.set_match('Man Utd 3 - 0 Liverpool')
  def set_match(match)
    ht, at = match.split(/- */)
    home_team_score = ht.split(/ /)[-1].to_i
    away_team_score = at.split(/ /)[0].to_i

    home_team = Team.find_or_create_by(name: ht.split(/ /)[0...-1].join(' '))
    home_team.update_rating(home_team_score, away_team_score)

    away_team = Team.find_or_create_by(name: at.split(/ /)[1..].join(' '))
    away_team.update_rating(away_team_score, home_team_score)

    update(
      home_team:,
      away_team:,
      home_team_score:,
      away_team_score:
    )
  end

  def get_points(team_name)
    Team.find_or_create_by(name: team_name).points
  end

  def get_goals_for(team_name)
    Team.find_or_create_by(name: team_name).scored_goals
  end

  def get_goals_against(team_name)
    Team.find_or_create_by(name: team_name).conceeded_goals
  end

  def get_goal_difference(team_name)
    get_goals_for(team_name) - get_goals_against(team_name)
  end

  def get_wins(team_name)
    Team.find_or_create_by(name: team_name).wins
  end

  def get_draws(team_name)
    Team.find_or_create_by(name: team_name).draws
  end

  def get_losses(team_name)
    Team.find_or_create_by(name: team_name).loses
  end

end
