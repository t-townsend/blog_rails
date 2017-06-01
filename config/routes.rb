Rails.application.routes.draw do



  get 'password_resets/new'

  get 'password_resets/edit'

resources :posts do
  resources :comments, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
end

resources :sessions, only: [:new, :create] do
   delete :destroy, on: :collection
 end

resources :users do
  resources :likes, only: [:index]
end

resources :password_resets, only: [:new, :create, :edit, :update]


root 'welcome#index'

end
