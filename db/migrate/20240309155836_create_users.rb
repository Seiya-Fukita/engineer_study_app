class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name, null: false, comment: "ユーザー名"
      t.string :username, null: false, comment: "@から始まる識別子"
      t.string :email, null: false
      t.date :birth_date, null: false, comment: "生年月日"
      t.string :biography, comment: "自己紹介"
      t.string :location, comment: "所在地"
      t.string :website, comment: "リンク"

      t.timestamps
    end
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
end
