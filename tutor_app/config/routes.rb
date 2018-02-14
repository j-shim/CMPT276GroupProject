Rails.application.routes.draw do

  get 'users/new'

  root 'welcome#index'

  get '/help', to:'welcome#help'
  get '/about', to:'welcome#about'
  get '/index', to:'welcome#index'
  get '/contact', to:'welcome#contact'
  get  '/signup',  to: 'users#new'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
