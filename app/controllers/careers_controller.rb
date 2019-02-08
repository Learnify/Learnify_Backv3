class CareersController < ApplicationController
  
  
  # GET /careers
  def index
    @careers = Career.all

    render json: @careers
  end

  # GET /careers/1
  def show
    render json: @career
  end

  # POST /careers
  def create
    @career = career.new(career_params)

    if @career.save
      render json: @career, status: :created, location: @career
    else
      render json: @career.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /careers/1
  def update
    if @career.update(career_params)
      render json: @career
    else
      render json: @career.errors, status: :unprocessable_entity
    end
  end

  # DELETE /careers/1
  def destroy
    @career.destroy
  end
end
