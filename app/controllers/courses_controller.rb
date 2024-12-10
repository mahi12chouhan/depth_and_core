class CoursesController < ApplicationController
	skip_before_action :verify_authenticity_token
	 

	def index
		courses = Courses.select(:id, :name)
		render json: courses, status: :ok
	end


  def course_title
    course = Courses.find_by(id: params[:courses_id])
    if course.present?
      course_titles = course.course_titles
      render json: course_titles, status: :ok
    else
      render json: { error: 'Course not found' }, status: :not_found
    end
  end
end
