class QuizsController < ApplicationController
  def index
    userdata=User.find_by_email(current_user.email)
    userid=userdata.id
    enrolldata=Enroll.where(:user_id => userid)
    courseIdArr=Array.new
    insEmails=Array.new
    @eligibleSurvey=Array.new
    if enrolldata
     enrolldata.each do |i|
        courseIdArr << i.course_id
     end
    end
    if courseIdArr
     courseIdArr.each do |i|  
        cmEmail=Course.find(i)
        insEmails << cmEmail.instructor_email
     end
    end
    if insEmails
       insEmails.each do |i|
        @eligibleSurvey << Survey.where(:email => i)
       
       end
       @eligibleSurvey.flatten!
    end
    
   puts "Instructors emails ====> #{@eligibleSurvey.flatten}"
        
    
  end

  def show
    @quiz=Survey.find(params[:id])
   
    
  end

  def new
    
  end

  def create
    
   
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end
end
