
# 「検索結果の一覧」を表示するindexアクションを定義
class Tweets::SearchesController < ApplicationController
  def index
    @tweets = Tweet.search(params[:keyword])
  end
end
