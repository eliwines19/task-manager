Rails.application.routes.draw do
  root "sessions#home"

  get '/projects/most_tasks' => 'projects#most_tasks'
  get '/projects/upcoming_dates' => 'projects#upcoming_dates'
  get '/tasks/upcoming_dates' => 'tasks#upcoming_dates'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  #login route
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  #logout route
  get '/logout' => 'sessions#destroy'

  #omniauth callback route
  get "/auth/google_oauth2/callback" => 'sessions#google'

  resources :projects do
    resources :tasks
  end

  resources :tasks

  resources :users do
    resources :projects, shallow: true
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
