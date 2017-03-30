Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :accounts do
    collection do
     get :login
   end
  end

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
