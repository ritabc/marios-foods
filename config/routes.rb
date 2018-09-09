Rails.application.routes.draw do
  root :to => 'home#index'

  resources "products" do
    collection do
      get "local"
    end
  end

  resources :products do
    resources :reviews
  end
end
