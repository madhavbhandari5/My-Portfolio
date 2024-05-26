Rails.application.routes.draw do
  resources :educations
  get 'home/index'
  get 'home/about'
  get 'home/contact'
  root 'home#index'
  resources :projects
  resources :skills
  get 'about', to: 'home#about'
  get 'contact', to: 'home#contact'
end
