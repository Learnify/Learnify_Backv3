class RolesController < ApplicationController
  before_action :set_role, only: [:show, :update, :destroy]
  skip_before_action :authenticate_request, only: [:show, :index]
  
  def index
      @roles = Role.all
      render json: @roles
  end

  # GET /roles/1
  def show
    render json: @role
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
    def set_role
      @role = Role.find(params[:id])
    end
 
    def role_params
        params.require(:role).permit(:name)
    end
end

#https://code.tutsplus.com/es/articles/crafting-apis-with-rails--cms-27695
