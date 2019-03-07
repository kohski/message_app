Rails.application.routes.draw do
  root 'messages#index'
  
  resources :messages do
    collection do
      post 'confirm'
    end
  end
end
