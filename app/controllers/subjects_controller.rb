class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :update, :destroy]
  skip_before_action :authenticate_request, only: [:show, :index, :showbyname]

    # GET /subjects
  def index
    @subjects = Subject.all

    render json: @subjects
  end

  # GET /subjects/1
  def show
    render json: @subject
  end

  # POST /subjectsname
  def showbyname
    @subjects = Subject.where("name like ?", params[:name])

     if @subjects.empty?
        render json: {"Message":"No existe el profesor"}
     else
        render json: @subjects.as_json(only: [:id, :name], include: { users: {only: [:id, :name]}}) 
     end
  end

  # POST /subjects
  def create
    @user = User.find(params[:user_id])
    @subject = Subject.where("name like ?", params[:name]).first

    if @subject.present?
      if @subject.users.include?(@user) 
        render json: {"Message":"Already exists user in subject"}
      else
        @subject.users << @user
        render json: @subject.as_json(except: [:user_id]), status: :accepted, location: @subject
      end
    else
      @subject = Subject.new(subject_params)

      if @subject.save
        render json: @subject, status: :created, location: @subject
      else
        render json: @subject.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /subjects/1
  def update
    if @subject.update(career_params)
      render json: @subject
    else
      render json: @subject.errors, status: :unprocessable_entity
    end
  end

  # DELETE /subjects/1
  def destroy
    @subject.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def subject_params
      params.require(:subject).permit(:name, :summary, :user_id)
    end
end
