ActiveAdmin.register CourseTitle do
  permit_params :title, :courses_id   

  index do
    selectable_column
    id_column
    column :title
    column :course do |course_title|
      course_title.courses.name   
    end
    actions
  end

  form do |f|
    f.inputs 'Course Title Details' do
      f.input :title
      f.input :courses_id, as: :select, collection: Courses.all.map { |course| [course.name, course.id] }, label: "Select Course"  # Adjusted to courses_id
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :course do |course_title|
        course_title.courses.name  
      end
    end
  end

  filter :title
  filter :course
end
