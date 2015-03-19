Rails.application.routes.draw do

  resources :questions do
    resources :answers

  post :upvote, on: :member
  post :downvote, on: :member

  end

  # these two routes work but they are not all restful
  # put '/questions/:id/upvote' => 'questions#upvote', as: :question_upvote
  # put '/questions/:id/downvote' => 'questions#downvote', as: :question_downvote


  # You can have the root of your site routed with "root"
   root 'questions#index'



# resources :historical_events, only:[:index] do
#   get :search, on: :collection
#   post :upvote, on: :member
#   post :downvote, on: :member
# end


  # resources :questions do
  #   resources :answers
  # end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


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
