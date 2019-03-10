class UsersController < ApplicationController
  before_action :set_user, only: [:show, :subjects, :articles, :update, :destroy]
  skip_before_action :authenticate_request, only: [:subjects, :articles]

  # GET /users
  def index
    @users = User.all

    render json: @users.as_json(except: [:password_digest, :updated_at, :role_id, :career_id], include: { career: {only: [:name]}, role: {only: [:name]}})
  end

  # GET /users/1
  def show
    render json: @user.as_json(except: [:password_digest, :updated_at, :role_id, :career_id], include: { career: {only: [:name]}, role: {only: [:name]}, subjects: {only: [:name]}})
  end

  # GET /subjectsp
  def subjects
    render json: @user.as_json(only: [:id, :name, :last_name, :email], include: { subjects: {only: [:id, :name]}})
  end

  # GET /articlesp
  def articles
    render json: @user.as_json(only: [:id, :name, :last_name, :email], include: { articles: {except: [:updated_at, :user_id]}})
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      UserMailer.welcome_email(@user).deliver
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :last_name, :email, :password, :password_confirmation, :role_id, :career_id)
    end
end
