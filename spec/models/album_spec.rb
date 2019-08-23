require 'rails_helper'

RSpec.describe Album, type: :model do
	# artist = Artist.new(name: 'Nipsey Hussle')

	# let(:artist) { Artist.create! }

	describe 'validations' do
		it 'is valid' do
			# instantiate a valid album and ensure it is valid
			# album = Album.new(name: 'Victory Lap', artist_id: artist.id)
			album = Album.new(name: 'Victory Lap', artist_id: 1)
			result = album.valid?
			errors = album.errors.full_messages

			expect(result).to be true
			expect(errors).to be_empty
		end

		it 'is invalid without a name' do
			# instantiate an album without a name and ensure it is invalid
			album = Album.new(name: nil)
			result = album.valid?
			errors = album.errors.full_messages

			expect(result).to be false
			expect(errors).to include("Name can't be blank")
		end
	end

	describe 'attributes' do
		it 'has expected attributes' do
			# ensure exactly the expected attributes are present on an album
			album = Album.new(name: 'Shenzhou')
			result = album.attribute_names.map(&:to_sym)

			expect(result).to contain_exactly(
				:name,
				:id,
				:available,
				:artist_id,
				:created_at,
				:updated_at
			)
		end
	end

	context 'scopes' do
		describe 'available' do
			it 'returns a list of available albums sorted by name' do
				# set up a some available albums and unavailable albums and make expecations that the
				# available albums scope only returns available albums sorted by name
				a = Album.new(name: 'Shenzhou', available: true)
				b = Album.new(name: 'Victory Lap', available: false)
				albums = [a, b]
				results = albums.select { |album| album.available == true }
				expect(results.count).to be 1
			end
		end
	end

	describe '#length_seconds' do
		it 'calculates the total length in seconds of an album' do
			test_album =
				Album.new(name: 'Mailbox Money', available: true, artist_id: 1)
			a_song =
				Song.new(
					title: 'Overtime',
					track_number: 3,
					length_seconds: 50,
					album_id: test_album.id
				)
		end
	end
end
