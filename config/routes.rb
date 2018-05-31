Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  get "/tags/:id" => 'tags#show'
  get "/tags" => 'tags#index'
  get "tags/:id/prototypes" => "tags#prototypes"

  resources :prototypes, only: [:index, :new, :create, :edit, :update, :show, :destroy]  do
    resources :tags, only:[:create, :new, :update, :edit, :destroy]
    resources :comments, only:[:create, :new, :update, :edit, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
end
