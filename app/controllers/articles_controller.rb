class ArticlesController < ApplicationController
  before_action :require_user, except: [:show, :index]
  before_action :article, except: %i(index new create)
  # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  def index
    @articles = Article.all.paginate(page: params[:page], per_page: 10)
  end

  def show
    @comments = article.comments
  end

  def new
    @article = Article.new
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
    article.update(article_params) if article.user == current_user
    if article.update(article_params)
      redirect_to article
    else
      render 'edit'
    end
  end

  def destroy
    article.destroy if @article.user == current_user
  end

  private

  def article
    @article ||= Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text)
          .merge(user_id: current_user.id)
  end
end
