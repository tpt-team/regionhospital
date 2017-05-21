Rails.application.routes.draw do
  resources :hemodialysis_department, only: :index, as: :hemodialysis
  resources :allergy_department, only: :index, as: :allergy
  resources :vascular_surgery, only: :index, as: :vascular
  resources :traumatological_department, only: :index, as: :traumatological

  resources :articles, path: 'blog' do
    resources :comments
  end

  root 'welcome#index'

  devise_for :users, :controllers => {registrations: :registrations}
  get 'persons/profile', as: 'user_root'
end
