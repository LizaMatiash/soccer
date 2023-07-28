class CreateLeagueTables < ActiveRecord::Migration[7.0]
  def change
    create_table :league_tables do |t|
      t.integer :home_team_score, default: 0
      t.integer :away_team_score, default: 0

      t.references :home_team, foreign_key: { to_table: :teams }
      t.references :away_team, foreign_key: { to_table: :teams }

      t.timestamps
    end
  end
end
