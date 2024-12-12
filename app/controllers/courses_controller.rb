class CoursesController < ApplicationController
	skip_before_action :verify_authenticity_token
	
	def index
      courses = Courses.all
      render json: courses, each_serializer: CoursesSerializer
    end

    def show
      course = Courses.find(params[:id])
      render json: course, serializer: CoursesSerializer
    end
end
