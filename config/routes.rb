Rails.application.routes.draw do
  use_doorkeeper

  api_version module: 'V1',
              path: { value: 'v1' },
              defaults: { format: :json } do
                resources :aliases, except: [:new, :edit]
                resources :companies, except: [:new, :edit]
                resources :domains, except: [:new, :edit]
                resources :users, except: [:new, :edit]
              end
end
