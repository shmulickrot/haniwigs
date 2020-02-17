Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'main_page#index'
  resources :main_page
  # get 'main_page', to: 'main_page#index'
  # get 'thanks', to: 'thanks#index'
  get "*", to: "main_page#index"
end
