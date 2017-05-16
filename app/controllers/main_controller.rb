class MainController < ApplicationController
    before_action :check_logout
    
    def index
        @auclubs = Auclub.all
    end
    
    def about
    end
    
    def check_logout
      if user_signed_in? && current_user.accept == false
        flash[:danger] = "관리자 승인이 필요합니다."
        sign_out(current_user)
      end
    end
end
