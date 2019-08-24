require 'rails_helper'

RSpec.describe 'Get Album', type: :request do
	# create an album in the db to request with
	let(:artist) { Artist.create!(name: 'Rick Sanchez') }
	let(:album) do
		Album.create!(name: 'Get Swifty', available: true, artist_id: artist.id)
	end
	describe 'GET /api/v1/albums/:id' do
		it 'gets the album' do
			get api_v1_album_path(album)
			json_body = JSON.parse(response.body).deep_symbolize_keys

			# write an expectation about the response status code
			expect(response).to have_http_status(200)
			# write an expecation about the response json_body
			expect(json_body).to include({ name: 'Get Swifty' })
		end
	end
end
