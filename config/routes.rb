Rails.application.routes.draw do
  get 'sessions/new'

  #get 'welcome/index'
  get 'employees/directory'

  resources :areas do
    resources :employees
  end

  #get 'areas/:id', to: 'areas#show', as: 'area'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  root 'employees#directory'

end
