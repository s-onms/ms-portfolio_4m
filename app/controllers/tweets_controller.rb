class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]


  # 作ったコントローラー（tweets）にアクション（index）を設定する
  def index
    @tweets = Tweet.all
    # モデル名は大文字であることが注意！
    # ↑def アクション名
    # インスタンス変数（にしたテーブル名） =全てのレコードを渡す
    #   end
  end

  def new
    @tweet = Tweet.new
    # 新規投稿機能を実装する為に、さっき作ったコントローラー（tweets）にアクション（new）を設定する
    # 単数！
  end
  
  # 未だわからん
  def create
    Tweet.create(tweet_params)
    # モデルのクラス.アクション名(引数として保存するデータの値を用意)
  end

  # 未だわからん
  def destroy
    # インスタンスがいらないのは別画面にならないから別に不要だから（多分）
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

  # 未だわからん
  def edit
    # @tweet = Tweet.find(params[:id])
  end

  # 未だわからん
  def update
    # デストロイ同様、インスタンスがいらないのは別画面にならないから別に不要だから（多分）
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
  end

  def show
    # ↓ここはeditと同じなのは、なんで？
    # 同じだからbefore actionでまとめる
    # @tweet = Tweet.find(params[:id])
  end

  def search
  end
  
  # 未だわからん
  private
  # プライベートメソッドはアクセスを制約する為のメソッド
  def tweet_params

    # params.permit(:name, :image, :text) これは間違い
    # requireがないとparamsの中の指定の値の存在をチェック出来ない（お墨付きをえていないからエラーになる）
    params.require(:tweet).permit(:name, :image, :text)
    # 1：requireがparamsの中に指定の値があるかチェックする
    # 2：permitが:name以下の項目が用意されているかチェックする
  end

  # before actionを定義したらこれが最後にいる今回は2つしか同じとこないから、メリットない
  def set_tweet
    @tweet = Tweet.find(params[:id]) 
  end
  
end
