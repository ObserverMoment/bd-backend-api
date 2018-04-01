Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :test_users, defaults: { format: :json }
      resources :test_ideas, efaults: { format: :json }
    end
  end
end
