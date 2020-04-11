# rails g model tweet でTweetモデルを作成すると、このマイグレファイルが作成される

class CreateTweets < ActiveRecord::Migration[5.2]
            # ↑テーブル名
  def change
    create_table :tweets do |t|
      t.string :name
      t.string :text
      t.text :image
      # ↑カラムを作成する

      t.timestamps
    end
  end
end
