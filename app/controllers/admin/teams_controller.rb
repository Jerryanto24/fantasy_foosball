class Admin::TeamsController < Admin::BaseController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
  end

  # GET /teams/new
  def new
    @team = Team.new

    #get list of user that does not have a team yet
    @users = User.all
                  .joins('LEFT JOIN teams player1 on player1.player_one_id = users.id
                          LEFT JOIN teams player2 on player2.player_two_id = users.id')
					        .select(' users.id ,users.first_name, users.last_name ')
					        .where('player1.id is null and player2.id is null')

  end

  # GET /teams/1/edit
  def edit

    #get list of user that does not have a team yet
    @users = User.all
                  .joins('LEFT JOIN teams player1 on player1.player_one_id = users.id
                          LEFT JOIN teams player2 on player2.player_two_id = users.id')
					        .select(' users.id ,users.first_name, users.last_name ')
                  .where('(player1.id is null and player2.id is null) or (player1.id = ? or player2.id = ?)',params[:id], params[:id])

                 
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save

        format.html { redirect_to admin_teams_path, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
       
      else

        #this will invoke create.js.erb (formmat.js)
        format.js
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }

      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to admin_teams_path, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        #this will invoke create.js.erb (formmat.js)
        format.js
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      
      #this will invoke create.js.erb (formmat.js)
      format.js
      format.html { redirect_to teams_url, notice: 'Team was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:team_name, :player_one_id, :player_two_id)
    end
end
