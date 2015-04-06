Rails.application.routes.draw do

  root  'home#index'
  
  get     '/blog_posts/index'
  get     '/blog_posts/new' => 'blog_posts#new'
  post    '/blog_posts/new' => 'blog_posts#create', as: :blog_posts
  get     '/blog_posts/:id' => 'blog_posts#show', as: :blog_post
  patch   '/blog_posts/:id' => 'blog_posts#update'
  delete  '/blog_posts/:id' => 'blog_posts#destroy'
  get     '/blog_posts/edit/:id' => 'blog_posts#edit', as: :edit_blog_post
  post    '/blog_posts/edit/:id' => 'blog_posts#update'
  post    '/blog_posts/:id' => 'blog_posts#update'

  resources :blog_posts, only: [:show] do
    resources :blog_post_comments#, only: [:create]
  end


  get '/about' => "about#index"
 
  get '/home' => "home#index"

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
