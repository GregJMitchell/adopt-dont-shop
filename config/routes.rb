Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#welcome
  get '/', to: 'welcome#index'

  #shelters
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  post '/shelters', to: 'shelters#create'
  get '/shelters/:id', to: 'shelters#show'
  get '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  delete '/shelters/:id', to: 'shelters#destroy'
  #pets
  get '/pets', to: 'pets#index'
  get '/pets/:id', to: 'pets#show'
  get '/pets/:id/edit', to: 'pets#edit'
  patch '/pets/:id', to: 'pets#update'
  delete '/pets/:id', to: 'pets#destroy'
  #shelter pets
  get '/shelters/:id/pets', to: 'shelter_pets#pets'
  get '/shelters/:id/pets/new', to: 'shelter_pets#new_pet'
  post '/shelters/:id/pets', to: 'shelter_pets#create_pet'
  #users
  get '/users/new', to: 'users#new'
  get '/users/:id', to: 'users#show'
  post '/users', to: 'users#create'

  #reviews
  get '/shelters/:id/reviews/new', to: 'shelter_reviews#new'
  post '/shelters/:id/reviews', to: 'shelter_reviews#create'
  get "/reviews/:id/edit", to: "shelter_reviews#edit"
  patch '/reviews/:id', to: "shelter_reviews#update"
  delete '/reviews/:id', to: 'shelter_reviews#destroy'

  #applications
  get "/applications/:id", to: "user_applications#show"
end
