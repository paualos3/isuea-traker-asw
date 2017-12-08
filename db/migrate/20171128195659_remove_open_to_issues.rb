class RemoveOpenToIssues < ActiveRecord::Migration
  def change
    remove_column :issues, :open, :string
  end
end
