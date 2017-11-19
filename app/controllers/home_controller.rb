class HomeController < ApplicationController
    def index
        if current_user
            redirect_to '/issues' and return
        end
    end
end
