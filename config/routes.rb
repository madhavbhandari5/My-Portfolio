Rails.application.routes.draw do
  root 'home#index'

  resources :resumes, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :users, only: [:new, :create]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :educations

  resources :projects
  resources :skills

  get 'about', to: 'home#about'
  get 'contact', to: 'home#contact'
end
