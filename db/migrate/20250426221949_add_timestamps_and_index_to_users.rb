class AddTimestampsAndIndexToUsers < ActiveRecord::Migration[8.0]
  def change
    # Add a unique index to the email column
    add_index :users, :email, unique: true
  end
end
