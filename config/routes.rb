Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :albums, only: %i[index show] do
				resources :songs, only: %i[index]
			end

			resources :artists, only: %i[index show] do
				resources :albums, only: %i[index]
			end
			resources :songs, only: %i[index show]
			resources :users, only: %i[index show create] do
				resources :playlists, only: %i[create index]
			end
			resources :playlists, only: %i[show] do
				resources :songs, only: %i[index create]
			end
  end
end
