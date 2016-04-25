Rails.application.routes.draw do

  post 'trading/trade'

  get 'trading/requests'

  post 'trading/send_request'

  post 'trading/accept'

  post 'trading/reject'

  post 'trading/item_selection'

  post 'trading/select'

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
    end
  end

  resources :messages, only: [:new, :create]

  get "/battles" => "battles#index"

  post "/battles/:id/capture" => "battles#capture"

  get "battles/npc" => "battles#npc"

  post "/battles/:id/accept" => "battles#accept"

  get "/battles/:id/decline" => "battles#decline"

  get "/battles/with/:username" => "battles#with"

  post "/battles/challenge" => "battles#challenge"

  get "/battles/:id" => "battles#show"

  post "/battles/:id/turn" => "battles#turn"

  post '/login_attempt' => "sessions#login_attempt"

  get '/logout' => "sessions#logout"

  get '/' => "sessions#home", as: :root

  get '/profile' => "sessions#profile"

  get '/settings' => "sessions#settings"

  get "/pets/:id" => "pets#show"

  get "/pets/" => "pets#index"

  get "/breeds/:id" => "breeds#show"

  get "/items/:id" => "item_types#show"

  get "/playeritems/:id" => "items#show"

  get "/inventories/:id" => "inventories#show"

  post "/inventories/:id" => "inventories#feed"

  get "/inventory" => "inventories#user"

  get 'friends/find'

  post 'friends/send_request' => 'friends#send_request'

  get 'friends/review'
  
  post 'friends/accept' => 'friends#accept'
  
  post 'friends/reject' => 'friends#reject'

  get 'friends/list'

  resources :users

  # npc shops
  get "/shops/new" => "shops#new"

  get "/shops/:id" => "shops#show"

  get "/shops/shop_named/:name" => "shops#show_by_name"

  post "/shops/shop_named/:name" => "shops#buy"

  post "/shops/:id" => "shops#buy"

  namespace :worlds do

      get "/" => "worlds#index"

      get "/world_alpha" => "world_alpha#index"

      get "/world_alpha/food_kitchen" => "world_alpha#food_kitchen"

      get "/world_alpha/food_kitchen_inside" => "world_alpha#food_kitchen_inside"

  end

  namespace :games do

    get "/tapeworm" => "tapeworm#index"

    get "/space_shooter" => "space_shooter#index"

    get "/hungry_dog" => "hungry_dog#index"

    get "/injured_birb" => "injured_birb#index"

    get "/" => "games#index"

  end
  
  namespace :api do

    resources :users

    post "/users/:id/pay" => "users#pay"

    post "/users/:id/buy" => "users#buy"

    post "/games/quote" => "games#quote"

    post "/games/submit_score" => "games#submit_score"

  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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
