class CreateGames < ActiveRecord::Migration[5.2]

  def self.up
  create_table :games do |t|
    t.string   :game_name, :limit => 200
    t.integer  :match_id
    t.integer  :home_point
    t.integer  :away_point
    t.integer  :winner_team_id
    t.integer  :loser_team_id
    t.timestamps
	 end
  end

  def self.down
    execute <<-SQL
      DROP TABLE games;
    SQL
  end
end
