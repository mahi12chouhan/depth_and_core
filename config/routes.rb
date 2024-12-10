Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'signup', to: 'accounts#create'
  post 'login', to: 'logins#login'

  resources :courses, only: [:index] do 
    get 'course_title/:courses_id', to: 'courses#course_title', on: :collection, as: 'course_title'
  end
end
