class CommentsController < ApplicationController
  before_action :require_user, only: :create
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params) if comment_params[:body].present?
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy if @comment.user == current_user
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id)
  end
end
