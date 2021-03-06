MindBliss::Application.routes.draw do
  # devise_for :users

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

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root :to => "static_pages#home"

  match '/home', to: 'home#index', via: 'get', :as => :logged_in_home

  match '/about', to: 'static_pages#about', via: 'get'

  match '/gratitudes', to: 'gratitudes#create', via: 'post'

  # SendLove routes
  resources :sendloves, :only => [:create]
  # SendLove Reply
  get '/replylove' => 'sendloves#reply'

  # Dream routes
  resources :dreams, :only => [:create]

  # Exercise routes
  resources :exercises, :only => [:create]

  namespace :inbound do
    match '/sendlove', to: 'inbound_emails#sendlove', via: 'post'
  end

  

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :brains, :only => [:update]
      resources :api_users, :only => [:create]
      # resources :tokens, :only => [:create, :destroy]
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
