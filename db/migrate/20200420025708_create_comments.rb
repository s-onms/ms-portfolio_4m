class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :tweet_id
      t.text :text
      # ↑カラム作成後はモデルにアソシエーション設定

      t.timestamps
    end
  end
end
