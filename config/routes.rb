Rails.application.routes.draw do
  root 'esite_controllers#index'
  devise_for :users
  #get 'cart/index'
  namespace :admin do
    resources :products
  end
  #get 'product/index'
  get '/cart' => 'cart#index'
  get '/cart/clear' => 'cart#clearcart'
  get '/cart/:id' => 'cart#index'
  get '/cart/clearcartById/:product_id' => 'cart#clearcartById'
  get '/cart/clearAddQtyById/:product_id' => 'cart#clearAddQtyById'
  get '/cart/clearDelQtyById/:product_id' => 'cart#clearDelQtyById'
  get '/contact' => 'esite_controllers#contact'
  get '/home' => 'esite_controllers#index'
  #get '/users/sign_out' => 'esite_controllers#index'
  get '/error' => 'esite_controllers#E404'
  get '/blog' => 'esite_controllers#blog'
  get '/checkout' => 'cart#checkout'
  post '/checkout' => 'cart#checkout'
  get "productsDesc/category/:category_id" => 'product#index'
  get "productsDesc/subcategory/:subcat_id/category/:category_id" => 'product#index'
  get "productsDesc/subcategory/:subcat_id/category/:category_id/cart/:product_id" => 'product#add'
  get "home/subcategory/:subcat_id/category/:category_id/cart/:product_id" => 'esite_controllers#add'
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
