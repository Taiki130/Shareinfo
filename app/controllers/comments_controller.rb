# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post_id = params[:post_id]
    if @comment.save
      flash[:notice] = 'コメントしました。'
      redirect_back(fallback_location: post_url(:post_id))
    else
      flash[:notice] = 'コメントできませんでした。'
      redirect_back(fallback_location: post_url(:post_id))
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    redirect_back(fallback_location: post_path(:post_id))
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
