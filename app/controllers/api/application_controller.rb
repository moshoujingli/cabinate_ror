module Api
    class ApplicationController < ActionController::Base
        print 'apiiiiii'
        protect_from_forgery with: :null_session
        respond_to :json
        before_filter :ban_action, :only => [:new, :edit]
        private
        def ban_action
            head :see_other
        end
    end
end
