Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      match '/login',     to: 'sessions#create', via: :pos

      match '/posts',     to: 'posts#index',  via:  :get
      match '/posts/:id', to: 'posts#show',   via:  :get
      match '/posts',     to: 'posts#create', via: :post

      match '/reports/by_author', to: 'reports#show', via: :post
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
