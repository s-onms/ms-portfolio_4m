class CommentsController < ApplicationController

  def create
    
    # Comment.create(comment_params)
    # ↑大文字、小文字
    # ↓に書き換え 理由？
    # binding.pry

    comment = Comment.create(comment_params)
    # これから作るから、find（IDの箱を見つけ出す）やIDは不要
    # これから、コメントの箱を作るというイメージ

    redirect_to "/tweets/#{comment.tweet.id}"
    # コメントと結びつく詳細画面に遷移させる

  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end
end
