class CourseTitle < ApplicationRecord
  belongs_to :courses

  def self.ransackable_attributes(auth_object = nil)
    ["courses_id", "created_at", "id", "title", "updated_at"]
  end
   def self.ransackable_associations(auth_object = nil)
    ["courses"]
  end
end
