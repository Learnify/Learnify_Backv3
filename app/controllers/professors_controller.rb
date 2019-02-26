class ProfessorsController < ApplicationController
  def index
      @professors = User.where(role_id: 1)
      render json: @professors.as_json(except: [:password_digest, :created_at, :updated_at])
  end
    
  def show
     @professor = User.find(params[:id])
     if(@professor.role_id == 1)
         render json: @professor.as_json(except: [:password_digest, :created_at, :updated_at])
     else
         render json: {"Message":"Usuario no es profesor"}
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
        #No tiene permisos para crear profesores
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
    # Only allow a trusted parameter "white list" through.
    def professor_params
      params.require(:user).permit(:name, :last_name, :email, :password_digest, :role_id, :career_id)
    end
end
