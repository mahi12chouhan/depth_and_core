class Courses< ApplicationRecord
	has_one_attached :icon
	validates :name, presence: true, uniqueness: true
	has_many :course_titles
	accepts_nested_attributes_for :course_titles
end
