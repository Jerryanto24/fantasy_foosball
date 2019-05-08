class Match < ApplicationRecord

    #relationship
    belongs_to :game_type , foreign_key: "game_type_id"
    has_many :games, :dependent => :destroy, primary_key: :id
    accepts_nested_attributes_for :games, :allow_destroy => true


    #winner team/loser team
    belongs_to :match_winner, class_name: 'Team' , foreign_key: "winner_team_id", optional: true
    belongs_to :match_loser, class_name: 'Team' , foreign_key: "loser_team_id", optional: true

    #home team/away team
    belongs_to :home_team, class_name: 'Team' , foreign_key: "home_team_id", optional: true
    belongs_to :away_team, class_name: 'Team' , foreign_key: "away_team_id", optional: true

    #players
    belongs_to :home_player_one, class_name: 'User' , foreign_key: "home_player_one_id", optional: true
    belongs_to :home_player_two, class_name: 'User' , foreign_key: "home_player_two_id", optional: true

    belongs_to :away_player_one, class_name: 'User' , foreign_key: "away_player_one_id", optional: true
    belongs_to :away_player_two, class_name: 'User' , foreign_key: "away_player_two_id", optional: true

    #validation
    validates_presence_of :match_name, message: "Match name can't be blank "
    validates_presence_of :home_team_id, message: "Home team can't be blank "
    validates_presence_of :away_team_id, message: "Away team can't be blank "
    validates_presence_of :home_player_one_id, message: "Home player one can't be blank "
    validates_presence_of :away_player_one_id, message: "Away player one can't be blank "


end
