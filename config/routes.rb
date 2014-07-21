Inzdrav::Application.routes.draw do
  resources :ingredients

  resources :forma_vypuskas
  get 'search' => 'search#search', :as => 'search'
  resources :comments, :defaults => { :commentable => 'user' }
  get "medications/:id/show_modal" => 'medications#show_modal', :as => :show_modal
  get "users/show_modal_login" => 'users#show_modal_login', :as => :show_modal_login
  resources :helpfuls do 	
    	resources :comments, :defaults => { :commentable => 'helpful' }
  end	
    
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'  
  devise_for :users, :controllers  => {
             :registrations => 'registrations',
            
             }
  resources :users, :only => [:show, :new]
  
  #resources :medications

  resources :medications do
    resources :helpfuls
    member do  
      get 'helpful'
    end
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
