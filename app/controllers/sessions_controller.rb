class SessionsController < Devise::SessionsController
   def new
     super

   end

   def create
     # to fix the nil email problem
     hash=User.find_by_email(current_user.email)
     session[:user_type]=hash.user_type
     if(session[:user_type]=='admin')
      redirect_to admin_path
     
     else
     super
     end
   end
  
end
