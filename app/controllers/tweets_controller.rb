class TweetsController < ApplicationController
  
  # 作ったコントローラー（tweets）にアクション（index）を設定する
  def index
    @tweets = Tweet.all
    # モデル名は大文字であることが注意！
    # ↑def アクション名
    # インスタンス変数（にしたテーブル名） =全てのレコードを渡す
    #   end
  end

  def new
    @tweets = Tweet.all
    # 新規投稿機能を実装する為に、さっき作ったコントローラー（tweets）にアクション（new）を設定する
    # 単数！
  end
  
  # 未だわからん
  def create
    Tweet.create(tweet_params)
  end

  # 未だわからん
  private
  def tweet_params
    params.permit(:name, :image, :text)
  end

  
end
