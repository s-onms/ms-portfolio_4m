class UsersController < ApplicationController

  # マイページに表示させたいものはここで追加出来る(表示できる)
  def show

    # @nickname = current_user.nickname
    # ↑@nicknameは、ログインユーザーのニックネームを取得する

    # @tweets = current_user.tweets
    # ↑@tweets:ログインユーザーの投稿を取得する
    # ↑「 current_user」のままだと、どの投稿者の投稿を選択しても、現在ログインしているユーザーのマイページしか表示されない

    user = User.find(params[:id])
    @nickname = user.nickname
    @tweets = user.tweets.page(params[:page]).per(8).order("created_at DESC")
    # マイページ側にもページネーション追加

  end
end
