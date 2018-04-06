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
  post '/create_student_tutor', to:'users#create_student_tutor'
  get '/redirect', to: 'tutor_sessions#redirect', as: 'redirect'
  get '/callback', to: 'tutor_sessions#callback', as: 'callback'
  get '/calendars', to: 'tutor_sessions#calendars', as: 'calendars'
  get '/events/:calendar_id', to: 'tutor_sessions#events', as: 'events', calendar_id: /[^\/]+/
  post '/events/:calendar_id', to: 'tutor_sessions#new_event', as: 'new_event', calendar_id: /[^\/]+/



  resources :users do
    resources :comments
  end
  resources :tutor_sessions,          only: [:create, :destroy,:edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
