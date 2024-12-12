ActiveAdmin.register Courses do 
  permit_params :name, :icon

  index do
    selectable_column
    id_column
    column :name
    column :image do |course|
      if course.icon.attached?
        image_tag url_for(course.icon), size: '100x100'
      end
    end
    column :created_at
    actions
  end
 
  form do |f|
    f.inputs 'Courses' do
      f.input :name
      f.input :icon, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :created_at
      row :updated_at
      row :image do |course|
        if course.icon.attached?
          image_tag url_for(course.icon), size: '100x100'
        else
          "No Image"
        end
      end
    end
  end


  filter :name
  filter :created_at
end
