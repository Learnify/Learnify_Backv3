class RolesController < ApplicationController
  def index
      @roles = Role.all
      render json: @roles
  end
    
  def create
    @role = Role.new(role_params)
    if @role.save
        render json: @role, status: :created
    else
        render json: @role.errors, status: :unprocessable_entity
    end
  end
    
  def destroy
    @role = Role.find_by(params[:id])
    if @role
      @role.destroy
    else
      render json: {role: "not found"}, status: :not_found
    end
  end
    
  private
 
    def role_params
        params.require(:role).permit(:name)
    end
end

#https://code.tutsplus.com/es/articles/crafting-apis-with-rails--cms-27695
