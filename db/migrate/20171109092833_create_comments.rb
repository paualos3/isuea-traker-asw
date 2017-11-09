class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :issueId
      t.text :content
      t.integer :votes

      t.timestamps
    end
  end
end
