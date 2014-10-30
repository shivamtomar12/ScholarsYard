class SessionsController < Devise::SessionsController
   def new
     super

   end

   def create
     super
     hash=User.find_by_email(current_user.email)
     session[:user_type]=hash.user_type
     
   end
end
