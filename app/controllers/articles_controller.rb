class ArticlesController < ApplicationController
  before_action :require_user, except: [:show, :index]
  # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  def index
    @articles = Article.all.paginate(page: params[:page], per_page: 10)
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments.paginate(page: params[:page], per_page: 10)
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params) if @article.user == current_user
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy if @article.user == current_user

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text).merge(user_id: current_user.id)
  end
end
