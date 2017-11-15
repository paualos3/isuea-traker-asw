class Issue < ApplicationRecord
    
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

