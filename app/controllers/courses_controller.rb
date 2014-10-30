class CoursesController < ApplicationController
	def index
		@user_type = session[:user_type]
		puts @user_type
		@courses = Course.all
	end
	def new
	end
	def create
		@course = Course.create!(params[:course])
    	flash[:notice] = "#{@course.course_name} was successfully created."
    	redirect_to courses_path
	end
	def show
		id = params[:id]
		@course = Course.find(id)
	end
	def edit
	end
	def update
	end
	def destroy
		@course = Course.find(params[:id])
    	@course.destroy
    	flash[:notice] = "Course '#{@course.course_name}' is deleted."
    	redirect_to courses_path
	end
end
