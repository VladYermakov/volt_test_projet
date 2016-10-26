Rails.application.routes.draw do

  #match '/login',     to: 'sessions#create', via: :pos

  match '/api/v1/posts',     to: 'api/v1/posts#index',  via:  :get
  match '/api/v1/posts/:id', to: 'api/v1/posts#show',   via:  :get
  match '/api/v1/posts',     to: 'api/v1/posts#create', via: :post

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
