Rails.application.routes.draw do

  root 'welcome#index'

  get    '/login',   to: 'welcome#index'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  get '/help', to:'welcome#help'
  get '/about', to:'welcome#about'
  get '/index', to:'welcome#index'
  get '/contact', to:'welcome#contact'
  get '/tutors', to:'welcome#tutors'
  get  '/signup',  to: 'users#new'
  post  '/signup',  to: 'users#create'
  resources :users
  resources :tutor_sessions,          only: [:create, :destroy,:edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
