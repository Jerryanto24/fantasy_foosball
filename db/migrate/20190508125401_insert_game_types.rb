class InsertGameTypes < ActiveRecord::Migration[5.2]
  def self.up

     #insert static data into game types
     GameType.create :game_type_name => "1 Player game"
     GameType.create :game_type_name => "2 Player game"

  end
 
  def self.down
  end   
  
end
