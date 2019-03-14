class ProfessorsController < ApplicationController
  before_action :set_professor, only: [:show, :update, :destroy]
  skip_before_action :authenticate_request, only: [:index, :show, :showbyname]

  def index
      @professors = User.where(role_id: 1)
      render json: @professors.as_json(except: [:password_digest, :updated_at, :role_id, :career_id], include: { career: {only: [:name]}, role: {only: [:name]}})
  end
    
  def show
     @professor = User.find(params[:id])
     if(@professor.role_id == 1)
         render json: @professor.as_json(except: [:password_digest, :updated_at, :role_id, :career_id], include: { career: {only: [:name]}, role: {only: [:name]}})
     else
         render json: {"Message":"User is not a professor"}
     end
  end

  # POST /professorsname
  def showbyname
    @professor = User.where("name like ? AND role_id=1) OR (last_name like ? AND role_id=1", params[:name], params[:last_name])

     if @professor.empty?
        render json: {"Message":"Professor does not exist"}
     else
        render json: @professor.as_json(only: [:id, :name, :last_name]) 
     end
  end
    
  def create
    if current_user.admin
        @professor = User.new(professor_params)

        if @professor.save
          render json: @professor, status: :created, location: @professor
        else
          render json: @professor.errors, status: :unprocessable_entity
        end
    else
      render json: {"Message":"You do not have permissions to create a professor"}
    end
  end
    
  def edit
      if current_user.admin
        @professor = User.find(params[:id])
        render json: @professor
      end
  end

  def update
    if current_user.admin
        if @user.update(user_params)
          render json: @user
        else
          render json: @user.errors, status: :unprocessable_entity
        end
    end
  end

  # DELETE /users/1
  def destroy
    if current_user.admin
        @professor = User.find(params[:id])
        @professor.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professor
      @professor = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def professor_params
      params.require(:user).permit(:name, :last_name, :email, :password, :password_confirmation, :role_id, :career_id)
    end
end
