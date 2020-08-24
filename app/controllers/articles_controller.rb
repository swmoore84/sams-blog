class ArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @articles_count = Article.where("title ILIKE ?", "%#{params[:query]}%").count
      @articles = policy_scope(Article).where("title ILIKE ?", "%#{params[:query]}%").page(params[:page]).per(5).order(created_at: :asc)
    else
      @articles_count = Article.all.count
      @articles = policy_scope(Article).page(params[:page]).per(5).order(created_at: :asc)
    end
  end

  def show
    @article.views_count += 1
    @article.save
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

    def article_params
      params.require(:article).permit(:title, :content, :published_date, :published)
    end

    def set_article
      @article = Article.find(params[:id])
      authorize @article
    end
end


