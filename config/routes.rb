Rails.application.routes.draw do
  get 'students/create'
  get 'students/show'
  get 'students/update'
  get 'students/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :instructors, only: [:create, :show, :update, :destroy ]
  resources :students, only: [:create, :show, :update, :destroy ]
end
