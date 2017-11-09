class AddCommentsToIssues < ActiveRecord::Migration[5.1]
  def change
    add_column :issues, :comments, :array
  end
end
