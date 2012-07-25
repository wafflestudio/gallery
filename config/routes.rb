Gallery::Application.routes.draw do

  get "members/show"

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :members
	get "main/index"

	match 'main/:id' => 'main#show', :via => :get, :as => :main_show
  match 'projects/:id' => 'projects#show', :via => :get, :as => :projects_show
  match 'sketches/:id' => 'sketches#show', :via => :get, :as => :sketches_show
  match 'projects' => 'projects#index', :via => :get, :as => :projects
  match 'sketches' => 'sketches#index', :via => :get, :as => :sketches
  match 'members/:id' => 'members#show', :via => :get, :as => :member

#  namespace :admin do
#    match '/' => 'admin#index'
#    resources :projects do
#      resources :project_images do
#        collection do
#          post 'sort'
#        end
#      end
#    end
#    resources :sketches
#  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'main#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
