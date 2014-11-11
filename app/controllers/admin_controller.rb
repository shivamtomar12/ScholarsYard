#This file is app/controllers/admin_controller.rb
class AdminController < ApplicationController
def index

@users=nil
retval=Hash.new
retval=User.where(User.arel_table[:user_type].not_eq('admin'))
val=retval.delete_if{|key, value| value == "admin" }

@users=val

#@users = User.paginate(:page => params[:page], :per_page => 5)
#puts "!!!!!!!!!!idsjfosnfndskfnsknv after  #{@users}"
end

def change_user
puts "!!!!!!!!!!idsjfosnfndskfnsknv"
 hash=params[:system_user]
 
  if hash==[] or hash==nil
   flash[:warning] = "No user selected!!"
   
  else
   array=hash.keys
   array.each do |val|
    temp=val.split(',')
    if temp[1]=='user'
         selecteduser=User.find_by_email(temp[0])
         selecteduser.user_type='content_manager'
         selecteduser.save!
    elsif temp[1]=='content_manager'
         selecteduser=User.find_by_email(temp[0])
         selecteduser.user_type='user'
         selecteduser.save!
    else
         selecteduser=User.find_by_email(temp[0])
         selecteduser.user_type='content_manager'
         selecteduser.save!
    end
   end
   flash[:notice] = "User type changed successfully!!!"
   
  end
 redirect_to admin_path
end
end
