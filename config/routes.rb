MindBliss::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root :to => "home#index"

  devise_for :users,
             :controllers => {
               :omniauth_callbacks => "users/omniauth_callbacks",
               :sessions => 'sessions',
               :registrations => 'registrations',
               :passwords => 'passwords'
             } do

    # route :providers to 404 if doesn't exist
    #get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end
  
  devise_scope :user do 
    get "/login" => "devise/sessions#new"
    delete "/logout" => "devise/sessions#destroy"
  end

  get '/home' => 'dashboard#index', :as => :logged_in_home
    
  # user_info for brand new user callouts info
  # (:create is used for updating user_info, not necessarily create)
  resources :user_info, :only => [:create]

  namespace :api do
    namespace :v1 do
      resources :api_images
      resources :api_users, :only => [:create, :index]
      resources :tokens, :only => [:create, :destroy]
      match '/tokens/google' => 'tokens#google', :via => :post
      match '/tokens/facebook' => 'tokens#facebook', :via => :post

    end

    # and in the future...
    # namespace :v2 do
    #   resources :collections
    # end
  end





  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
