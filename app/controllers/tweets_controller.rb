# 基本ここはツイートモデルのコントローラーを作成しているから、「tweetクラス」＋アクション名

class TweetsController < ApplicationController
  # 同じ記載なのでset_tweetの行でまとめる
  before_action :set_tweet, only: [:edit, :show]

  # 最初はインデックス、showアクション以外は初期画面に移動。
  # インデックスを除くのはもうそこにいてるから
  # showを除くのはログインしてなくても見れるようにするから
  before_action :move_to_index, except: [:index, :show]


  # 作ったコントローラー（tweets）にアクション（index）を設定する
  def index
    # @tweets = Tweet.all
    # モデル名は大文字であることが注意！
    # ↑def アクション名
    # インスタンス変数（にしたテーブル名） =全てのレコードを渡す

    @tweets = Tweet.includes(:user).order("created_at DESC").page(params[:page]).per(8)
    # 1：includesメソッド：ツイート表示する際、アソシエーションを利用して投稿者のニックネームが表示されるように「ユーザー情報」を「先に読み込む」設定
    # 2：orderメソッド：順番を変更
    # 3：ページネーション
  end

  def new
    @tweet = Tweet.new
    # 新規投稿機能を実装する為に、さっき作ったコントローラー（tweets）にアクション（new）を設定する
    # 単数！
  end
  
  # 少し分かった
  def create
    # 大文字、小文字
    Tweet.create(tweet_params)
    # 「モデルのクラス名.アクション名」で、引数として保存するデータの値を用意
    # ツイートの箱を作るというイメージ
    
  end

  # 少し分かった
  def destroy
    # インスタンスがいらないのは別画面にならないから別に不要だから（多分）
    tweet = Tweet.find(params[:id])
    tweet.destroy
    # findはどれにするか対象を選択する（IDの箱を見つけ出す）時に使うイメージ
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

    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
    # コメント機能追加
  end

  def search
  end
  
  # 未だわからん
  private
  # プライベートメソッドはアクセスを制約する為のメソッド

  def tweet_params

    # params.permit(:name, :image, :text) これは間違い
    # requireがないとparamsの中の指定の値の存在をチェック出来ない（お墨付きをえていないからエラーになる）

    # params.require(:tweet).permit(:name, :image, :text)
    # ダブルチェックしている
    # 1：requireがparamsの中に指定の値があるかチェックする
    # 2：permitが:name以下の項目が用意されているかチェックする
    
    # params.require(:tweet).permit(:name, :image, :text).merge(user_id: current_user.id)
    # mergeメソッドで2つのハッシュ（ユーザーID）を統合

    params.require(:tweet).permit(:image, :text).merge(user_id: current_user.id)
    # :nameカラムを削除
    # それにより、「ツイートの保存時」にnameカラムに情報を保存しないよう変更

  end

  # before actionを定義したらこれが最後にいる今回は2つしか同じとこないから、メリットない
  def set_tweet
    @tweet = Tweet.find(params[:id]) 
  end

  # ログインしていない場合、indexアクションのindex.html.erbのページにリダイレクトする
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
  
end
