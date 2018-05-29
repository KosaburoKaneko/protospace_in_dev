Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  get "/tags/:id" => 'tags#show'
  get "/tags" => 'tags#index'


  resources :prototypes, only: [:index, :new, :create, :show, :destroy]  do
    resources :tags, only:[:create, :new, :update, :edit, :destroy]
    resources :comments, only:[:create, :new, :update, :edit, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
end
