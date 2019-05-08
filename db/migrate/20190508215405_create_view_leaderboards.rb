class CreateViewLeaderboards < ActiveRecord::Migration[5.2]
  def self.up

    execute <<-SQL
    CREATE VIEW foosball_leaderboards AS

    select teams.id, teams.team_name
    , total_win.total_win
    , total_lose.total_lose
    , (total_win.total_win + total_lose.total_lose) as total_match 
    , CAST(total_win.total_win AS FLoat) /(total_win.total_win + total_lose.total_lose) * 100 AS win_percentage
    FROM teams teams
    LEFT OUTER JOIN (
      select match1.winner_team_id ,count(match1.winner_team_id) total_win FROM matches match1
      group by match1.winner_team_id 
      ) total_win on total_win.winner_team_id = teams.id
    LEFT OUTER JOIN (
      select match2.loser_team_id ,count(match2.loser_team_id) total_lose FROM matches match2
      group by match2.loser_team_id 
      ) total_lose on total_lose.loser_team_id = teams.id


    SQL


  end
 
  def self.down
    execute <<-SQL
    drop view foosball_leaderboards
    SQL

  end   
  
end
