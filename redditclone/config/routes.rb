Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create, :show, :index]

  resources :subs do
    resources :posts, except: [:index]
  end

  

  resource :session, only: [:new, :create, :destory]
end
