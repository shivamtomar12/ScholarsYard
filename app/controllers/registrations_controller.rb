class RegistrationsController < Devise::RegistrationsController
  # def new
  #   super
  # end

  def create
     super
    if current_user==nil
     flash[:notice] = "Please enter correct credentials"
    else
     hash=User.find_by_email(current_user.email)
     hash.user_type="user"
     session[:user_type]=hash.user_type
     hash.save
     puts "current user #{session[:user_type]}"
    end
     
     
   end

end
