Rails.application.routes.draw do
  resources :articles
  resources :profiles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'welcome#home'

  get 'about', to: 'welcome#about'

  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  # post 'users', to: 'users#create'
end
