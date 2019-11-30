# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :login_required, only: %i[new create]
  def index
    @users = User.order(:updated_at).page(params[:page]).per(15)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_url(@user), notice: 'ユーザーの新規登録が完了しました。'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to users_url(@user), notice: 'ユーザーを更新しました。'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to posts_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image, :password, :password_confirmation)
  end
end
