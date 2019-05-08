class Admin::MatchesController < Admin::BaseController
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.all
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
  end

  # GET /matches/new
  def new
    @match = Match.new
    @teams = Team.all

    @games =  @match.games.build 
  end

  # GET /matches/1/edit
  def edit
    @teams = Team.all 
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(match_params)

    respond_to do |format|
      if @match.save
        format.html { redirect_to admin_matches_path, notice: 'Match was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        #this will invoke create.js.erb (formmat.js)
        format.js        
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)

        format.html { redirect_to admin_matches_path, notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        #this will invoke create.js.erb (formmat.js)
        format.js        
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      #this will invoke create.js.erb (formmat.js)
      format.js      
      format.html { redirect_to admin_matches_path, notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #ajax
  def get_players

    #get condition if team has two player or one player based on game type
    @condition = ""
    if (params[:game_type_id] == 2)
      @condition = "player_one_id is not null and player_two_id is not null"

    else 
      @condition = "1 = 1"
    end
      
    #get team details
    @teams = Team.all.where(' id = ? and ' + @condition, params[:team_id])

    #get user details
    if @teams.count > 0
    
      @users = User.all.where(' id = ? or id = ? ' , @teams[0].player_one_id, @teams[0].player_two_id)
    else
      @users = ""

    end

    render :json => {
      :data => @users
    }.to_json
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.require(:match).permit(:id, :match_name, :game_type_id, :home_team_id, :away_team_id, :home_player_one_id, :home_player_two_id, :away_player_one_id, :away_player_two_id, :winner_team_id, :loser_team_id, games_attributes:[:id, :game_name, :home_point, :away_point, :winner_team_id, :loser_team_id, :created_at, :updated_at])
    end
end
