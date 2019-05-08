class Game < ApplicationRecord
    
    #relationship
    belongs_to :match, optional: true , foreign_key: :match_id
    belongs_to :game_winner, class_name: 'Team' , foreign_key: "winner_team_id", optional: true
    belongs_to :game_loser, class_name: 'Team' , foreign_key: "loser_team_id", optional: true

    #validation
    #winning point is 10 so need home team or away team meet 10
    validate :winning_point
    def winning_point
        if (home_point != 10  && away_point != 10)
            errors.add(:home_point,"Please make sure the point is meet 10. Game winning point is 10 ")
            errors.add(:away_point, "")
        end    
    end

end
