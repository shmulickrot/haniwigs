Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'main_page#index'
  resources :main_page
  # get 'main_page', to: 'main_page#index'
  get '*', to: 'main_page#index'
  get 'thanks', to: 'thanks#index'
  get "*path", to: redirect('/')
  constraints(host: /^(?!www\.)/i) do
    match '(*any)' => redirect { |params, request|
      URI.parse(request.url).tap { |uri| uri.host = "www.#{uri.host}" }.to_s
    }, via: [:get,:post]
  end
end
