class Comment < ApplicationRecord
  # コメント多→投稿1
  belongs_to :tweet  # tweetsテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション
end
