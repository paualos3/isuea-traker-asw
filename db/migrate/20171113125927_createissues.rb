class Createissues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :issue
      t.string :description
      t.string :user
      t.integer :votes
      t.string :pinnedId
      t.string :category
      t.string :open
      t.string :priority
      t.timestamps
    end
  end
end
