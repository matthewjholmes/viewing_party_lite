Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get '/users/:user_id', to: 'users#show', as: 'dashboard'

resources :users, only: [:create, :show, :new] do
  resources :discover, only: :index
  resources :movies, only: [:index, :show] do
    resources :parties, only: [:create, :new]
  end
end

post "/users/:user_id/movies/:movie_id/parties/new", to: "parties#create", as: 'new_party'

get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
delete '/login', to: 'sessions#destroy'

get '/register', to: 'users#new', as: 'register'

root to: "landing#index"

post 'twilio/voice' => 'twilio#voice'

end
