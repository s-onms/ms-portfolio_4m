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
    @tweet = Tweet.new
    # 新規投稿機能を実装する為に、さっき作ったコントローラー（tweets）にアクション（new）を設定する
    # 単数！
  end
  
  # 未だわからん
  def create
    Tweet.create(tweet_params)
    # モデルのクラス.アクション名(引数として保存するデータの値を用意)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    # ?なんで小文字でいいの
    tweet.destroy
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

  
end
