Rails.application.routes.draw do
  root 'todo_tasks#index'

  resources :todo_tasks do
    member do
      patch :toggle_complete
    end
  end

  resources :categories   # already gives you index, new, create, edit, update, destroy

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
