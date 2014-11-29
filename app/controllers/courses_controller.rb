class CoursesController < ApplicationController
	def index
		@user_type = session[:user_type]
		puts @user_type
		if @user_type=="user" or current_user==nil 
    		@courses = Course.all
                else
		@courses = Course.where(:instructor_email => current_user.email)
		end
	end
	def new
	end
	def create
		val=params[:course]
		val[:instructor_email]=current_user.email
		@course = Course.create!(val)
    	flash[:notice] = "#{@course.course_name} was successfully created."
    	redirect_to courses_path
	end
	def show
		id = params[:id]
		@course = Course.find(id)
	end
	def edit
	end
	
	def destroy
		@course = Course.find(params[:id])
    	@course.destroy
    	flash[:notice] = "Course '#{@course.course_name}' is deleted."
    	redirect_to courses_path
	end
        
        def update
         
         @course = Course.find(params[:id])
         userhash=User.find_by_email(current_user.email)
         val=Enroll.where(:user_id => userhash[:id], :course_id => @course[:id])
	 if val==[]
         @enroll=Enroll.create!({:user_id => userhash[:id], :course_id => @course[:id]})
	 else
  	 flash[:notice] = "Already registered for the course!!!"
         end
         redirect_to courses_path
        end
end
