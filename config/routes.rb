Hotel::Application.routes.draw do
  
  # change admin/sign_in path to admin_signin
  devise_for :admins, :skip => [:sessions]
  as :admin do
    get 'admin_signin' => 'admins/devise/sessions#new', :as => :new_admin_session
    post 'admin_signin' => 'admins/devise/sessions#create', :as => :admin_session
    delete 'admin_signout' => 'admins/devise/sessions#destroy', :as => :destroy_admin_session
  end
  #change users
  devise_for :users, :skip => [:sessions]
  as :user do
    get    'signin' => 'devise/sessions#new', :as => :new_user_session
    post   'signin' => 'devise/sessions#create', :as => :user_session
    delete 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  root 'home#index'
  get '/admins' => 'admins/home#index' 
  
 namespace :admins do
   resources :restaurants,:photos,:menus,:locations,:social_infos,:cities,:countries
   
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
