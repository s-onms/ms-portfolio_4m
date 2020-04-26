class Tweet < ApplicationRecord
  validates :text, presence: true
  
  # ？？mergeメソッドを作ったら下記でアソシエーションを各々作る
  belongs_to :user

  has_many :comments  
  # commentsテーブルとのアソシエーション

  
  # 検索処理を作成
  # モデムにテーブルから検索するためのsearchメソッドを定義
  def self.search(search)
    # searchメソッド
    if search
      Tweet.where('text LIKE(?)', "%#{search}%")
      # モデル名(大文字).whereメソッド
      # ('text LIKE(?)', "%#{search}%")で「searchが含まれるタイトル」で検索
    else
      Tweet.all
    end
  end


end
