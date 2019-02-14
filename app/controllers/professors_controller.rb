class ProfessorsController < ApplicationController
  def index
      @professors = User.where(role_id: 1)
      render json: @professors
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
        #No tiene permisos para crear profesores
    end
  end

  # DELETE /users/1
  def destroy
    @professor = User.find(params[:id])
    @professor.destroy
  end

  private
    # Only allow a trusted parameter "white list" through.
    def professor_params
      params.require(:user).permit(:name, :last_name, :email, :password_digest, :role_id, :career_id)
    end
end
