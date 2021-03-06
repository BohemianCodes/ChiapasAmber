Rails.application.routes.draw do

  devise_for :users
  resources :users
  root 'products#index'

  resources :products do
    resources :comments
  end

  get 'static_pages/about'
  get 'static_pages/contact'
  get 'static_pages/index'
  post 'static_pages/thank_you'

  post 'payments/create'


  resources :orders, only: [:index, :show, :create, :destroy]

  # default route
  # may go away in future versions of Rails
  # get ':controller (/:action (/:id))'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount ActionCable.server => '/cable'

end
