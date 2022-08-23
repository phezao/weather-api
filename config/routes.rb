Rails.application.routes.draw do
  resources :weathers

  post '/weather', to: 'weathers#create'
  get '/weather', to: 'weathers#index'
  get '/weather/:id', to: 'weathers#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
