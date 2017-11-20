class WatchRelationship < ActiveRecord::Base
    belongs_to :watcher, class_name: "User"
    belongs_to :watched, class_name: "Issue"
    validates :watcher_id, presence: true
    validates :watched_id, presence: true
end
