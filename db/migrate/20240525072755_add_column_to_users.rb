class AddColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :confirmed_at, :datetime
  end
end
