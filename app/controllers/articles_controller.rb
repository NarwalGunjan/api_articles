class ArticlesController < ApplicationController
  skip_forgery_protection
  def new
  end

  def create
    @article = Article.create!(title: article_params[:title], description: article_params[:description])
    render json: @article
  end

  def update
    @article = Article.find(params[:id]).update!(title: article_params[:title], description: params[:description])
    render json: @article
  end

  def destroy
    @article = Article.destroy(params[:id])
    render json: Article.all
  end

  def index
    @articles = Article.all
    render json: @articles
  end

  def show
    @article = Article.find(params[:id])
    render json: @article
  end

  private
  def article_params
    params.require(:article).permit(:id, :title, :description)    
  end
end
