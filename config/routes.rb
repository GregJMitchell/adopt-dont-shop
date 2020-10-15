Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #shelters
  get '/', to: 'welcome#index'
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  post '/shelters', to: 'shelters#create'
  get '/shelters/:id', to: 'shelters#show'
  get '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  delete '/shelters/:id', to: 'shelters#destroy'
  get '/shelters/:id/new_review', to: 'shelters#new_review'
  post '/shelters/:id', to: 'shelters#create_review'
  get "shelters/:id/edit_review", to: "shelters#edit_review"
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
end
