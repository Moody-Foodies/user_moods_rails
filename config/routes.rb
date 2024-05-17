Rails.application.routes.draw do
  # Remove error from render deployment
  root to: proc { [200, {}, ['API is up and running']] }

  namespace :api do
    namespace :v1 do
      resources :moods, only: [:index, :create]
    end
  end
end
