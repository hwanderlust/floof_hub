Rails.application.routes.draw do
  get 'register/user' => 'users#new', as: 'register_user'
  post 'users' => 'users#create'

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'locations/new'
  get 'locations/create'
  get 'locations/edit'
  get 'locations/update'
  get 'locations/destroy'
  get 'locations/index'
  get 'locations/show'
  get 'shelters/new'
  get 'shelters/create'
  get 'shelters/edit'
  get 'shelters/update'
  get 'shelters/destroy'
  get 'shelters/index'
  get 'pets/new'
  get 'pets/create'
  get 'pets/edit'
  get 'pets/update'
  get 'pets/destroy'
  get 'pets/index'
  # get 'users/new'
  # get 'users/create'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  get 'users/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
