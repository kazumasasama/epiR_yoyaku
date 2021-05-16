Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: { format: :json } do
    scope :v1 do
      resources :customers
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
          registrations: 'api/v1/auth/registrations',
          sessions: 'api/v1/auth/sessions',
          passwords: 'api/v1/auth/passwords'
      }
    end
  end
end
