class Team < ApplicationRecord
    
    #relationship
    belongs_to :player_one, class_name: 'User' , foreign_key: "player_one_id", optional: true
    belongs_to :player_two, class_name: 'User' , foreign_key: "player_two_id", optional: true

    has_many :games
    has_many :matches
    
    #validate presence/cannot be blank for fields
    validates_presence_of :team_name, message: "Team name can't be blank "
    validates_presence_of :player_one_id, message: "Player one can't be blank "
    validates :team_name, uniqueness: {message: "Team name has been taken"} , on: :create 

    #player 1 and player 2 cannot have same member/user
    validate :unique_team_member
    def unique_team_member
      if (!player_one_id.nil? && !player_two_id.blank?)
        if (player_one_id == player_two_id)
            errors.add(:player_two_id,"Please select other member for player two ")
        end
      end
    end

end
