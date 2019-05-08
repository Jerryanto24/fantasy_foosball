class Admin::FoosballLeaderboardsController < Admin::BaseController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    #get all user list
    @foosball_leaderboards = FoosballLeaderboard.all.order('win_percentage DESC')
                
  end

  def show
  end


  def new
  end


  def edit
  end


  def create
  end


  def update
   
  end

  def destroy
   
  end

  private

    def set_user
    end

  
    def user_params
    end
end
