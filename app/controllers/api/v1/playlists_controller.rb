# frozen_string_literal: true

module Api
	module V1
		class PlaylistsController < ApplicationController
			def index
				if params[:user_id].present?
					@playlist = Playlist.all
				else
					render json: @playlist.errors, status: 403
				end
			end

			def create
				@playlist = Playlist.new(playlist_params)

				if @playlist.save
					render json: @playlist,
					       status: :created,
					       location: api_v1_user_url(@playlist)
				else
					render json: @playlist.errors, status: :unprocessable_entity
				end
			end

			def show
				@playlist = Playlist.find(params[:playlist_id])
			end

			private

			def playlist_params
				params.require(:user).permit(:user_id)
			end
		end
	end
end
