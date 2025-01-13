class CreateCourseTitles < ActiveRecord::Migration[6.1]
  def change
    create_table :course_titles do |t|
      t.text :title
      t.integer :course_id

      t.timestamps
    end
  end
end
