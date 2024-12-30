ActiveAdmin.register CourseTitle do
  permit_params :title, :description, :courses_id, :image

  index do
    selectable_column
    id_column
    column :title
    column "Course" do |topic|
      topic.courses.name if topic.courses.present?
    end
    column "Image" do |topic|
      image_tag(topic.image, size: "50x50") if topic.image.attached?
    end
    actions
  end

  form do |f|
    f.inputs "Content Details" do
      f.input :courses_id, as: :select, collection: Courses.all.map { |c| [c.name, c.id] }, input_html: { id: "course-select" }
      f.input :title
      f.input :image, as: :file
    end
    f.actions
  end

  show do |topic|
    attributes_table do
      row :title
      row "Course" do
        topic.courses.name if topic.courses.present?
      end
      row "Image" do
        image_tag(topic.image, size: "100x100") if topic.image.attached?
      end
      row :created_at
      row :updated_at
    end
  end
end
