class AddAssigneeToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :assignee, :string
  end
end
