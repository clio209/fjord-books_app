# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  # 各ユーザーのfollowers,followingsを出力する
  def following
    @title = t('views.common.following')
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = t('views.common.followers')
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end
end
