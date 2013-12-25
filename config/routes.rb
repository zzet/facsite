FacSite::Application.routes.draw do

  scope module: :web do
    namespace :admin do
      resources :news
      resources :events
      resources :categories
      resources :documents
      resources :persones
      resources :questions do
        scope module: :questions do
          resource :answer
        end
      end
      resource :faculties

      root to: "welcome#index"
    end

    resources :news,        only: [:index, :show]
    resources :events,      only: [:index, :show]
    resources :documents,   only: [:index, :show]
    resources :persones,    only: [:index, :show]

    resources :categories,  only: [:index, :show] do
      scope module: :categories do
        resources :documents, only: [:index]
        resources :news,      only: [:index]
      end
    end

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
