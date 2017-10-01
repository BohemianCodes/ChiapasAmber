Rails.application.routes.draw do

  root 'static_pages#index'

  get 'demo/index'

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'

  # default route
  # may go away in future versions of Rails
  # get ':controller (/:action (/:id))'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
