class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.text :body
      t.datetime :created_at
      t.references :issue, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :comments, [:issue_id, :created_at]
    add_index :comments, [:user_id, :created_at]
  end
end
