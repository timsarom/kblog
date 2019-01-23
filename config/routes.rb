Rails.application.routes.draw do
  get 'about/index'
  get 'admin' => 'admin#index'
  get 'about' => 'about#index'

  controller :sessions do
  	get 'login' => :new
  	post 'login' => :create
  	delete 'logout' => :destroy
  end

  resources :users
  resources :posts do
    resources :comments
  end
  root "posts#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
