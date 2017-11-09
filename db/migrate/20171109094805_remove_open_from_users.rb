class RemoveOpenFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :open, :boolean
  end
end
