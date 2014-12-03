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
    puts "Testing ======================================"
    puts params["1"] 
    
    
    x=0
    y=0
    (1..5).each do |i|
     if params["#{i}"]
       x=x+1
       if Answer.find_by_content(params["#{i}"]).is_correct
        y=y+1
       end
     end
    end
    z=y*100/x
    k = Answer.find_by_content(params["1"])
    question=Question.find(k.question_id)
    survey=question.survey_id
    quiz=Quiz.new({:studentemail => current_user.email, :quizid => "#{survey}", :score => "#{z}"})
    quiz.save
    redirect_to quizs_path
    puts "Quiz id #{survey}"
    puts "no of questions #{x}"
    puts "Score is : #{z}%"
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end
end
