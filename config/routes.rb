Rails.application.routes.draw do
  root 'welcome#home'

  get 'register/user' => 'users#new', as: 'register_user'
  post 'users' => 'users#create'
  get 'users/:id' => 'users#show', as: 'user'
  get 'users/edit'
  patch 'users/update'
  delete 'users/destroy'


  get 'sessions/new'
  post 'sessions/create'
  delete 'sessions/destroy'




  get 'locations/index'
  get 'locations/show'

  get 'shelters/new'
  post 'shelters/create'
  get 'shelters/edit'
  patch 'shelters/update'
  delete 'shelters/destroy'
  get 'shelters/index'

  get 'pets/new'
  post 'pets/create'
  get 'pets/edit'
  patch 'pets/update'
  delete 'pets/destroy'
  get 'pets/index'
  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
