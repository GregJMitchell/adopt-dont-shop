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
  #pets
  get '/pets', to: 'pets#index'
  get '/pets/:id', to: 'pets#show'
  #shelter pets
  get '/shelters/:id/pets', to: 'shelter_pets#pets'
  get 'shelters/:id/pets/new', to: 'shelter_pets#new_pet'
  post '/shelters/:id/pets', to: 'shelter_pets#create_pet'
end
