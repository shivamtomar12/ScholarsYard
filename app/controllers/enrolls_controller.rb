class EnrollsController < ApplicationController
	def index
                @user=User.find_by_email(current_user.email)
    	        @enrolls=Enroll.where(:user_id => @user[:id])
		
		@enrollments=Array.new
		@enrolls.each do |course|
		  
		  @enrollments.push(Course.find(course[:course_id]))
 	        end
		puts "sda1111---- #{@enrollments}"

		
	end
	def new
	end
	
	def show

		id = params[:id]
		puts "sdasdaasda---- #{id}"
		@enrollment = Enroll.find(id)
	end
	def edit
	end
	def update
	end
	def destroy
		@enroll = Enroll.find(params[:id])
    	@enroll.destroy
    	flash[:notice] = "Course '#{@enroll.course_id}' is dropped."
    	redirect_to enrolls_path
	end

        def enroll
         @course = Course.find(params[:id])
         userhash=User.find_by_email(current_user.email)
         @enroll.create!({:user_id => userhash[:id], :course_id => @course[:id]})
         redirect_to course_path
        end
end
