class CreateOneTimePasswords < ActiveRecord::Migration[7.1]
  def change
    create_table :one_time_passwords do |t|
      t.integer :password, null: false
      t.datetime :expired_at, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
