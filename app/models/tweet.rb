class Tweet < ApplicationRecord
  validates :text, presence: true
  
  # ？？mergeメソッドを作ったら下記でアソシエーションを各々作る
  belongs_to :user

  has_many :comments  
  # commentsテーブルとのアソシエーション


end
