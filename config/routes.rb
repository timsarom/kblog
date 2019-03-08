Rails.application.routes.draw do
  get 'admin' => 'admin#index'
  get 'top' => 'posts#kebab_top'
  
  controller :sessions do
  	get 'login' => :new
  	post 'login' => :create
  	delete 'logout' => :destroy
  end

  resources :contacts
  resources :users
  resources :posts do
    resources :comments
    member do
      delete :delete_image
    end
  end
  root "posts#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
