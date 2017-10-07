Rails.application.routes.draw do

  resources :products
  root 'static_pages#landing_page'

  get 'demo/index'

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'

  resources :orders, only: [:index, :show, :create, :destroy]

  # default route
  # may go away in future versions of Rails
  # get ':controller (/:action (/:id))'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
