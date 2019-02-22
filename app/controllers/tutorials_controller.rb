class TutorialsController < ApplicationController
  def index
      @tutorials = Tutorial.all
      render json: @tutorials
  end
    
  def show
     @tutorial = Tutorial.find(params[:id])
     render json: @tutorial
  end
    
  def create
    @tutorial = Tutorial.new(tutorial_params)
    if @tutorial.save
        render json: @tutorial, status: :created, location: @tutorial
    else
        render json: @tutorial.errors, status: :unprocessable_entity
    end
  end
    
  def edit
    @tutorial = Tutorial.find(params[:id])
    render json: tutorial
  end

  def update
    @tutorial = Tutorial.find(params[:id])
    if @tutorial.update(user_params)
        render json: @tutorial
    else
        render json: @tutorial.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @tutorial = Tutorial.find(params[:id])
    @tutorial.destroy
  end

  private
    # Only allow a trusted parameter "white list" through.
    def tutorial_params
      params.require(:tutorial).permit(:appointment, :user_id, :professor_id, :subject_id)
    end
end
