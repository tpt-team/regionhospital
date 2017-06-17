Rails.application.routes.draw do
  resources :hemodialysis_department, only: :index, as: :hemodialysis
  resources :allergy_department, only: :index, as: :allergy do
    collection do
      get :advice
    end
  end
  resources :vascular_surgery, only: :index, as: :vascular
  resources :traumatological_department, only: :index, as: :traumatological
  resources :cards
  resources :patients
  resources :bookings, only: [:new, :create]
  resources :doctors, only: [:show, :index]
  resources :locales, only: :update, constraints: { id: /(en|ua)/ }

  resources :chat_rooms, only: [:new, :create, :show, :index]
  mount ActionCable.server => '/cable'

  resources :articles, path: 'blog' do
    resources :comments
  end

  resources :persons, only: :update, as: 'profile_update'

  root 'welcome#index'

  devise_for :users, controllers: { registrations: :registrations }
  get 'persons/profile', as: 'user_root'
end
