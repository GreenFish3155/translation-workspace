Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :accounts do
    resources :translations
    
    collection do
     post :login
   end
  end

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
