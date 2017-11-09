class AddVotesToIssues < ActiveRecord::Migration[5.1]
  def change
    add_column :issues, :votes, :integer
  end
end
