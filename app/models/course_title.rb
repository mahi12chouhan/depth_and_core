class CourseTitle < ApplicationRecord
	belongs_to :course, class_name: "Courses"
	has_one_attached :image
end
