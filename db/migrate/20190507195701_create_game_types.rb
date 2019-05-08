class CreateGameTypes < ActiveRecord::Migration[5.2]
  def self.up
    create_table :game_types do |t|
      t.string   :game_type_name
      t.timestamps
     end

  end
 
  def self.down
    execute <<-SQL
      DROP TABLE game_types;
    SQL
  end   
  
end
