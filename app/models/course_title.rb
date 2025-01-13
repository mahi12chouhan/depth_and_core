class CourseTitle < ApplicationRecord
	belongs_to :courses
	has_one_attached :image
end
