Rails.application.routes.draw do
  root 'welcome#home'

  get 'register/user' => 'users#new', as: 'register_user'
  post 'users' => 'users#create'
  get 'users/:id' => 'users#show', as: 'user'
  get 'users/:id/edit' => 'users#edit'
  patch 'users/:id' => 'users#update'
  delete 'users/destroy'


  get 'login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get 'locations/index'
  get 'locations/show'

  get 'shelters/index' => 'shelters#index', as: 'shelters'
  get 'shelters/register' => 'shelters#new', as: 'register_shelter'
  post 'shelters/home' => 'shelters#create'
  get 'shelters/:id' => 'shelters#show', as: 'shelter'
  get 'shelters/:id/edit' => 'shelters#edit'
  patch 'shelters/:id' => 'shelters#update'

  get 'pets/new'
  post 'pets/create'
  get 'pets/edit'
  patch 'pets/update'
  delete 'pets/destroy'
  get 'pets/index'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
