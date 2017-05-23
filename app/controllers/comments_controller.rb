class CommentsController < ApplicationController
  before_action :require_user, only: :create
  before_action :article, only: :destroy

  def create
    @comment = article.comments.build(comment_params)
    @comment.save if @comment.valid?
  end

  def destroy
    comment.destroy if comment.user == current_user
  end

  private

  def article
    @article ||= Article.find(params[:article_id])
  end

  def comment
    @comment ||= Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id)
  end
end
