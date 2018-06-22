Rails.application.routes.draw do
  root 'welcome#home'
  get 'about' => 'welcome#about'
  get 'contact' => 'welcome#contact'

  get 'register/user' => 'users#new', as: 'register_user'
  post 'users' => 'users#create'
  get 'users/:id' => 'users#show', as: 'user'
  get 'users/:id/edit' => 'users#edit', as: 'edit_user'
  patch 'users/:id' => 'users#update'
  delete 'users/destroy'
  get 'users/:id/pets' => 'users#show_pets', as: 'users_pets'

  get 'login' => 'sessions#new', as: 'login'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy', as: 'logout'

  get 'locations/index'
  get 'locations/show'

  get 'all-shelters' => 'shelters#index', as: 'shelters'
  get 'shelters/search' => 'shelters#search', as: 'search_shelters'
  post 'all-shelters' => 'shelters#create'
  get 'register/shelter' => 'shelters#new', as: 'register_shelter'
  get 'shelters/:id' => 'shelters#show', as: 'shelter'
  get 'shelters/:id/edit' => 'shelters#edit', as: 'edit_shelter'
  patch 'shelters/:id' => 'shelters#update'
  get 'shelters/:id/pets' => 'shelters#show_pets', as: 'shelters_pets'

  get 'list-pet' => 'pets#new', as: 'list_pet'
  get 'all-pets' => 'pets#index', as: 'pets'
  get 'pets/search' => 'pets#search', as: 'search'
  post 'all-pets' => 'pets#create'
  get 'pets/:id' => 'pets#show', as: 'pet'
  get 'pets/:id/edit' => 'pets#edit', as: 'edit_pet'
  patch 'pets/:id' => 'pets#update'
  get 'pets/:id/adopt' => 'pets#adopt', as: 'adopt_pet'
  delete 'pets/destroy'

  get 'meaty-matt' => 'welcome#matt'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
