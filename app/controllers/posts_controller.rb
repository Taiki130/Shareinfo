class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  skip_before_action :login_required, only: [:top, :index, :show]
  def top
    render layout: false
  end

  def index
    @q = current_user.posts.ransack(params[:q])
    @posts = @q.result(distinct: true).order(:updated_at)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save!
      redirect_to posts_url, notice: "投稿が完了しました。"
    else
      reneder :new
    end
  end

  def edit
  end

  def update
    @post.update!
    redirect_to posts_url, notice: "投稿を編集しました。"
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: "投稿を削除しました。"
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :image)
  end

  def set_post
    @post = current_user.posts.find(params[:id])
  end
end
