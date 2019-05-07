class CreateTeams < ActiveRecord::Migration[5.2]

    def self.up
     create_table :teams do |t|
	  t.string  :team_name, :limit => 200
    t.integer  :player_one_id
	  t.integer  :player_two_id
    t.timestamps
	 end
  end

  def self.down
    execute <<-SQL
      DROP TABLE teams;
    SQL
  end
end
