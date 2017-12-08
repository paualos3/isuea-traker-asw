class User < ApplicationRecord
  has_many :issues, dependent: :destroy 
  has_many :comments, dependent: :destroy 
  has_many :active_watches, class_name: "WatchRelationship", foreign_key: "watcher_id", dependent: :destroy
  has_many :watching, through: :active_watches, source: :watched
  acts_as_voter

  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
  
  #Watch an issue
  
  def watch(other)
    active_watches.create(watched_id: other)
  end
  
  def unwatch(other)
    active_watches.find_by(watched_id: other).destroy
  end
  
  def watching?(other)
    watching.include?(other)
  end
  
end
