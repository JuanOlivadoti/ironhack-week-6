Rails.application.routes.draw do
  devise_for :users
	get '/', to: 'products#index'
    get '/products/', to: 'products#index'
    get '/products/:id', to: 'products#details', as: :products_details

    post '/products/:product_id/reviews/', to: 'reviews#create', as: :product_reviews
    delete '/products/:product_id/reviews/:id', to: 'reviews#delete', as: :product_review

    resources :users, except: [ :edit, :update ] do
      resources :products, except: [:edit, :update, :index]
    end

    post '/products/:product_id/bids', to: 'bids#create', as: :product_bids

    root 'products#index'
end