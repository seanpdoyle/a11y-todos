Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :completions, only: :create
  resources :delays, only: :create

  resources :tasks, only: [] do
    resources :promotions, only: :create
    resources :reopenings, only: :create
  end

  constraints -> { _1.xml_http_request? } do
    resources :events, only: :new
  end

  root to: "tasks#index"
end
