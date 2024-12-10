ActiveAdmin.register Courses do controller do
    before_action :authenticate_admin_user!  
  end
 permit_params :name
 index do
    selectable_column
    id_column
    column :name
    column :created_at
    actions
  end
 
  form do |f|
    f.inputs 'Courses' do
      f.input :name
    end
    f.actions
  end

  filter :name
  filter :created_at
end
