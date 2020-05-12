class CommentsController < ApplicationController

  def create
    # comment = Comment.create(comment_params)
    # Comment.create(comment_params)
    # ↑大文字、小文字
    # ↓に書き換え 理由？
    # これから作るから、find（IDの箱を見つけ出す）やIDは不要
    # これから、コメントの箱を作るというイメージ
    # redirect_to "/tweets/#{comment.tweet.id}"
    # コメントと結びつく詳細画面に遷移させる

    # 非同期通信で下記に書き換え
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html { redirect_to tweet_path(params[:tweet_id])  }
      format.json
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
