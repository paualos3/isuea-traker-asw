class Comment < ActiveRecord::Base
    include ActionView::Helpers::DateHelper
    belongs_to :user
    belongs_to :issue
  
    def getUserName
        if user 
          self.user.username
        else
          return "noUser"
        end
    end
    
    def getUserId
      if user
        self.user.id
      else
        return 1
      end
    end
    
    def hoursAgo
      distance_of_time_in_words_to_now(created_at)
    end
    
    def userName
      if user
          user.name
      else return "no te user"
      end
    end
  
    def userURL
      if user
          "https://isuea-traker-asw-paualos3.c9users.io/users" + user_id.to_s
      else return "no te user"
      end
    end
end
