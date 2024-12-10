class CreateCourseTitles < ActiveRecord::Migration[6.1]
  def change
    create_table :course_titles do |t|
      t.string :title
      t.references :courses, null: false, foreign_key: true

      t.timestamps
    end
  end
end
