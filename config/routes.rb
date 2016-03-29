GmailAlerts::Application.routes.draw do

  root to: 'sessions#new'
  resources :sessions, only: :index
  get "/auth/:provider/callback" => 'sessions#create'

end


Rails.application.routes.draw do
  match "/sessions/index" => "sessions#index", :via => [:get, :post]
end