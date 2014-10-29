class SessionsController < Devise::SessionsController
   def new
     super

   end

   def create
     super
     hash=User.find_by_email(current_user.email)
     hash.user_type="user"
     session[:user_type]=hash.user_type
     puts "current user sign in #{session[:user_type]}"
   end
end
