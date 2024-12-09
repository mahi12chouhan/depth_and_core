class CoursesController < ApplicationController
	skip_before_action :verify_authenticity_token
	 

	def index
		courses = Courses.select(:id, :name)
		render json: courses, status: :ok
	end
end
