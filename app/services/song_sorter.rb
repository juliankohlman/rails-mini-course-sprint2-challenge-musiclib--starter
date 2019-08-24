class SongSorter
	def initialize(songs, sort)
		@songs = songs
		@sort = sort
	end

	def sort
		if sort == 'random'
			songs = songs.to_a.shuffle
		elsif sort == 'reverse'
			songs = songs.to_a.reverse
		else
			songs
		end
	end
end
