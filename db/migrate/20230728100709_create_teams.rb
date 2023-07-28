class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :points, default: 0
      t.integer :scored_goals, default: 0
      t.integer :conceeded_goals, default: 0
      t.integer :wins, default: 0
      t.integer :draws, default: 0
      t.integer :loses, default: 0

      t.timestamps
    end
  end
end
