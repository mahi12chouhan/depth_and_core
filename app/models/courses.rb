class Courses< ApplicationRecord
	def self.ransackable_attributes(auth_object = nil)
    ["id", "name", "created_at", "updated_at"]
  end
   belongs_to :admin_user
end