# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]
  skip_before_action :login_required, only: [:top]
  def top
    render layout: false
  end

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).order(:updated_at).page(params[:page]).per(15)
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.all
    @comment = current_user.comments.build
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save!
      redirect_to posts_url, notice: '投稿が完了しました。'
    else
      reneder :new
    end
  end

  def edit; end

  def update
    @post.update!
    redirect_to posts_url, notice: '投稿を編集しました。'
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: '投稿を削除しました。'
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :image)
  end

  def set_post
    @post = current_user.posts.find(params[:id])
  end
end
