class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    #get all user list
    @users = User.all.joins('LEFT JOIN teams player1 on player1.player_one_id = users.id
                             LEFT JOIN teams player2 on player2.player_two_id = users.id')
                  .select(' users.id ,users.first_name, users.last_name, CASE WHEN player1.team_name is not null THEN player1.team_name 
                                                        WHEN player2.team_name is not null THEN player2.team_name
                                                        ELSE "" END AS team_name')
                
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }    
      else

        #this will invoke create.js.erb (formmat.js)
        format.js
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }

      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_users_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else

        #this will invoke update.js.erb (formmat.js)
        format.js
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
        
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: 'User was successfully destroyed.' }
      #this will invoke create.js.erb (formmat.js)
      format.js
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name)
    end
end
