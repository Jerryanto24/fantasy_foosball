class CreateUsers < ActiveRecord::Migration[5.2]

  def self.up
    create_table :users do |t|
      t.string  :first_name, :limit => 100
      t.string  :last_name, :limit => 100
      t.timestamps
    end
  end

  def self.down
    execute <<-SQL
      DROP TABLE users;
    SQL
  end

end
