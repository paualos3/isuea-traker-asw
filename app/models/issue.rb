class Issue < ApplicationRecord
    
    acts_as_votable
    has_many :comments, :dependent => :destroy
    has_many :passive_watches, class_name: "WatchRelationship", foreign_key: "watched_id", dependent: :destroy
    has_many :watchers, through: :passive_watches, source: :watcher
    mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
    #serialize :attachments, JSON
    
    def isOpened
        if self.status == "Opened"
            logger.debug "Issue is opened" 
            return true
        end
        logger.debug "Issue is not opened" 
        return false
    end
    
    def isOnHold
        if self.status == "On holded"
            logger.debug "Issue is on hold" 
            return true
        end
        logger.debug "Issue is not on hold" 
        return false
    end    
    
    def isResolved
        if self.status == "Resolved"
            logger.debug "Issue is resolved" 
            return true
        end
        logger.debug "Issue is not resolved" 
        return false
    end

    def isDuplicate
        if self.status == "Duplicated"
            logger.debug "Issue is duplicate" 
            return true
        end
        logger.debug "Issue is not duplicate" 
        return false
    end 

    def isInvalid
        if self.status == "Invalid"
            logger.debug "Issue is invalid" 
            return true
        end
        logger.debug "Issue is not invalid" 
        return false
    end
    
    def isWontfix
        if self.status == "Wontfixed"
            logger.debug "Issue is wontfix" 
            return true
        end
        logger.debug "Issue is not wontfix" 
        return false
    end    
    
    def isClosed
        if self.status == "Closed"
            logger.debug "Issue is closed" 
            return true
        end
        logger.debug "Issue is not closed" 
        return false
    end
    
    def Votes
        self.get_upvotes.size
    end
    
    def getStatus
        if self.isOpened
            return "Opened"
        end
        
        if self.isOnHold
            return "On holded"
        end
        
        if self.isResolved
            return "Resolved"
        end
        
        if self.isDuplicate
            return "Duplicated"
        end
        
        if self.isInvalid
            return "Invalid"
        end
        
        if self.isWontfix
            return "Wontfixed"
        end
        
        return "Closed"
    end
end

