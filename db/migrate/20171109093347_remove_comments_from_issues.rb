class RemoveCommentsFromIssues < ActiveRecord::Migration[5.1]
  def change
    remove_column :issues, :comments, :array
  end
end
