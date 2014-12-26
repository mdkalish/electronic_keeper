Rails.application.routes.draw do
  root      'sessions#new'
  get       '/login'  => 'sessions#new'
  post      '/login'  => 'sessions#create'
  delete    '/logout' => 'sessions#destroy'
  # resources :products
  get       '/dashboard'         => 'products#index', :as => :products
  get       '/show_product/:id'  => "products#show", :as => :show_a_product
  post      '/add_to_ticket/:id' => "ticket_items#create", :as => :add_to_ticket
  patch     '/update_ticket_item/:id' => 'ticket_items#update', :as => :update_ticket_item
  get       '/show_category/:category_id' => 'categories#show', :as => :show_category
  post      '/create_ticket'     => 'tickets#create'
  delete    '/cancel_ticket'     => 'tickets#destroy'
  post      '/update_ticket'     => 'tickets#update'
  get       '/update_ticket'     => 'tickets#update'
  get       '/tickets'           => 'tickets#index', :as => :history
  get       '/tickets/:id/edit'  => 'tickets#edit', :as => :edit_ticket

  # YOU NEED TO DO SCOPE HERE: /ticket/:id/remove_product/:id

  get       '/admin_functions'    => 'nav_pages#admin_functions'
  get       '/home'               => 'nav_pages#home'
  resources :users



  # get ''
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
