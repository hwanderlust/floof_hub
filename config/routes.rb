Rails.application.routes.draw do
  root 'welcome#home'

  get 'register/user' => 'users#new', as: 'register_user'
  post 'users' => 'users#create'
  get 'users/:id' => 'users#show', as: 'user'
  get 'users/:id/edit' => 'users#edit'
  patch 'users/:id' => 'users#update'
  delete 'users/destroy'

  get 'login' => 'sessions#new', as: 'login'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy', as: 'logout'

  get 'locations/index'
  get 'locations/show'

  get 'shelters/new'
  post 'shelters/create'
  get 'shelters/edit'
  patch 'shelters/update'
  delete 'shelters/destroy'
  get 'shelters/index'

  get 'list-pet' => 'pets#new', as: 'list_pet'
  post 'pets/create'
  get 'edit-pet-details' => 'pets#edit', as: 'edit_pet'
  patch 'pets/update'
  delete 'pets/destroy'
  get 'all-pets' => 'pets/index', as: 'pets'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
