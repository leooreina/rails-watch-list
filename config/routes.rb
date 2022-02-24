Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists, only: %i(index create show new) do
    resources :bookmarks, only: %i(create new)
  end

  resources :bookmarks, only: :destroy

  root to: 'lists#index'
end
