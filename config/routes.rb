Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users/password/edit' => 'devise/passwords#edit'
  end

  authenticate :user do
    root 'home#index'
    resources :clientes do
      resources :enderecos
    end
    get 'home/index'

    resources :trabalhadors
    resources :servicos
    # config/routes.rb
    # config/routes.rb
    resources :contratos do
      collection do
        get 'search_clientes', to: 'contratos#search_clientes'
      end
    end

    get '/buscar_servicos', to: 'servicos#buscar', as: 'buscar_servicos'
    get '/buscar_clientes', to: 'clientes#buscar', as: 'buscar_clientes'
    get '/buscar_trabalhadors', to: 'trabalhadors#buscar', as: 'buscar_trabalhadors'
  end

  get 'sobre', to: 'pages#sobre'
  get 'conta', to: 'pages#conta'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
