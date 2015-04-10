class CoursesController < ApplicationController
	before_action :find_course,:only =>[:show,:update,:edit,:destroy]

	def index
		@course = Course.all
		if params[:course].present?
			@course = @course.where("course like ?","%#{params[:course]}%")
		end

		if params[:teacher].present?
			@course = @course.where("teacher like ?","%#{params[:teacher]}%")
		end

		if params[:time].present?
			@course = @course.where("time like ?","%#{params[:time]}%")
		end
	end

	def new
		@course = Course.new
	end

	def create
		@course = Course.new(course_params)
		if @course.save
			redirect_to courses_path
		else 
			render :new
		end
	end

	def show

	end

	def edit

	end

	def update
 		@course.update(course_params)
  		redirect_to courses_path
	end

	def destroy
		if @course.destroy
			redirect_to courses_path
		else 
			flash[:alert] = "Post unsuccessfully deleted"
			redirect_to courses_path
		end
	end



	private

	def course_params
		params.require(:course).permit(:course,:time,:teacher)

	end

	def find_course
		@course = Course.find(params[:id]) 
	end

end
