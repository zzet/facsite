FacSite::Application.routes.draw do

  scope module: :web do
    namespace :admin do
      resources :news

      root to: "welcome#index"
    end

    root to: "welcome#index"
  end

end
