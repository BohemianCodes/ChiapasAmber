Rails.application.routes.draw do

  root 'static_pages#landing_page'

  resources :products

  get 'static_pages/about'
  get 'static_pages/contact'
  get 'static_pages/index'


  resources :orders, only: [:index, :show, :create, :destroy]

  # default route
  # may go away in future versions of Rails
  # get ':controller (/:action (/:id))'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
