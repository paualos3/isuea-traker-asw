class AddOpenToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :open, :boolean
  end
end
