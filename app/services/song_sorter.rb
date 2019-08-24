class SongSorter
	# ? :sort_type params blew the stack when using :sort instead of :sort_type within if/elsif block
	attr_reader :songs, :sort_type

	def initialize(songs, sort_type)
		@songs = songs.to_a
		@sort_type = sort_type
	end

	def sort
		if sort_type == 'random'
			songs.shuffle
		elsif sort_type == 'reverse'
			songs.reverse
		else
			songs
		end
	end
end
