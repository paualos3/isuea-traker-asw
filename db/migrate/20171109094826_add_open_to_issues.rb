class AddOpenToIssues < ActiveRecord::Migration[5.1]
  def change
    add_column :issues, :open, :boolean
  end
end
