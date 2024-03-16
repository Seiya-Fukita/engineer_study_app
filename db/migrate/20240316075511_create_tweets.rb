class CreateTweets < ActiveRecord::Migration[7.1]
  def change
    create_table :tweets do |t|
      t.references :user, foreign_key: true, null: false, comment: "ユーザーID"
      t.string    :content, comment: "内容"
      t.datetime  :published_at, comment: "公開日時"

      t.timestamps
    end
  end
end
