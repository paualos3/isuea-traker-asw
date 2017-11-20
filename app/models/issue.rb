class Issue < ApplicationRecord
    
    acts_as_votable
    has_many :comments, :dependent => :destroy
    has_many :passive_watches, class_name: "WatchRelationship", foreign_key: "watched_id", dependent: :destroy
    has_many :watchers, through: :passive_watches, source: :watcher
    mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
    #serialize :attachments, JSON
    
    def isOpened
        if self.open == "t"
            logger.debug "Issue opened" 
            return true
        end
        logger.debug "Issue closed" 
        return false
    end
    
    
    def isClosed
        if self.open == "f"
            logger.debug "l Issue closed" 
            return true
        end
        logger.debug "l Issue opened" 
        return false
    end
    
    
        
    def getStatus
        if self.isOpened
            return "Opened"
        end
        
        return "Closed"
    end
end

