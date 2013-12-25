FacSite::Application.routes.draw do

  scope module: :web do
    namespace :admin do
      resources :news
      resources :categories
      resources :documents
      resources :questions do
        scope module: :questions do
          resource :answer
        end
      end
      resource :faculties

      root to: "welcome#index"
    end

    resources :news, only: [:index, :show]
    resources :guest_books
    resources :pages do
      collection do
        get :about
        get :contacts
      end
    end

    root to: "welcome#index"
  end
end
