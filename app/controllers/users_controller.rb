class UsersController < ApplicationController

  # マイページに表示させたいものはここで追加出来る
  def show

    # @nicknameは、ログインユーザーのニックネームを取得する
    @nickname = current_user.nickname

    # @tweetsは、ログインユーザーの投稿を取得する
    @tweets = current_user.tweets
  end
end
