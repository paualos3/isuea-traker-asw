class CreateWatchRelationships < ActiveRecord::Migration
  def change
    create_table :watch_relationships do |t|
      t.integer :watcher_id
      t.integer :watched_id

      t.timestamps null: false
    end
    add_index :watch_relationships, :watcher_id
    add_index :watch_relationships, :watched_id
    add_index :watch_relationships, [:watched_id, :watcher_id], unique: true
  end
end
