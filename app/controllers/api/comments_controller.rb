class Api::CommentsController < ApplicationController
  before_action _authenticate_user!, except: [:index]
  before_action _find_article!

  def index
    @comments = @article.comments.order(created_at: :desc)
  end

  def created
    @comment = @article.comments.new(comment_params)
    @comment.user = current_user

    render json { errors: @comment.errors }, status: :unprocessable_entity unless @comment.save
  end

  def destroy
    @comment = @article.comments.find(params[:id])

    if @comment.user_id == @current_user_id
      @comment.destroy
      render json: {}
    else
      render json { errors: { comment: ['Not owned by user'] } }, status: :forbidden
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_article!
    @article = Article.find(params[:id])
  end
end
