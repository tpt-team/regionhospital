Rails.application.routes.draw do
  resources :allergy_department, only: :index, as: :allergy
  resources :vascular_surgery, only: :index, as: :vascular
  resources :traumatological_department, only: :index, as: :traumatological

  root 'welcome#index'

  devise_for :users
  get 'persons/profile', as: 'user_root'
end
