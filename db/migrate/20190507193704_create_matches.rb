class CreateMatches < ActiveRecord::Migration[5.2]
  def self.up
    create_table :matches do |t|
      t.string   :match_name, :limit => 200
      t.integer  :game_type_id
      t.integer  :home_team_id
      t.integer  :away_team_id
      t.integer  :home_player_one_id
      t.integer  :home_player_two_id
      t.integer  :away_player_one_id
      t.integer  :away_player_two_id
      t.integer  :winner_team_id
      t.integer  :loser_team_id
      t.timestamps
     end
  end
 
  def self.down
    execute <<-SQL
      DROP TABLE matches;
    SQL
  end   
  
end
