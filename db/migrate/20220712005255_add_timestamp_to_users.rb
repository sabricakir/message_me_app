class AddTimestampToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users_tables, :created_at, :datetime
    add_column :users_tables, :updated_at, :datetime
  end
end
