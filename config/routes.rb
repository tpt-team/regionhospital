Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users
  get 'persons/profile', as: 'user_root'
end
