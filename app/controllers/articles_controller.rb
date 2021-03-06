class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]
  skip_before_action :authenticate_request, only: [:index, :show]

  # GET /articles
  def index
    @articles = Article.all

    render json: @articles.as_json(only: [:id, :title, :body, :visits_count, :url, :created_at], include: { user: {only: [:id, :name, :last_name]} })
  end

  # GET /articles/1
  def show
    @article.update_visits
    render json: @article
  end

  # POST /articles
  def create
    @article = Article.new(article_params)

    if @article.save
      render json: @article, status: :created, location: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    if @article.destroy
      render json: {"Message":"Article deleted successfully"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def article_params
      params.require(:article).permit(:title, :body, :visits_count, :url, :user_id)
    end
end
