Rails.application.routes.draw do



resources :posts do
  resources :comments, only: [:create, :destroy]
end




root 'welcome#index'

end
