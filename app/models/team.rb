class Team < ApplicationRecord
  has_many :league_tables

  def update_rating(scored_goals, conceeded_goals)
    update(
      scored_goals: self.scored_goals + scored_goals,
      conceeded_goals: self.conceeded_goals + conceeded_goals
    )
    calculate_points(scored_goals - conceeded_goals)
  end

  private

  def calculate_points(score_difference)
    case score_difference
    when -Float::INFINITY...0
      update(loses: loses + 1)
    when 0
      update(points: points + 1, draws: draws + 1)
    when 1..Float::INFINITY
      update(points: points + 3, wins: wins + 1)
    end
  end
end
