# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]

  # POST /comments
  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
     redirect_to @commentable, notice: t('controllers.common.notice_create', name: t('comment'))
    else
      flash[:alert] = t('controllers.common.notice_error')
      render action: "new"
    end
  end

  def new
    @comment = @commentable.comments.new
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
