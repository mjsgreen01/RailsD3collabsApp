class Artist < ActiveRecord::Base

	has_many :song_involvements
	has_many :songs, through: :song_involvements
	

	def self.search(search)
	  if search
	    where('name ILIKE ?', "%#{search}%")
	  else
	    where(nil)
	  end
	end

	def self.artistCollabs(artist)
		if artist
			searchedArtist = where('LOWER(name) = ?', "#{artist.downcase}").first
			puts 'searched artist is'
			if !searchedArtist
        return ['not a valid artist name']
      end
			puts searchedArtist
			# return all collaborations, and filter out the searched-for artist
			collabsArray = searchedArtist.songs.map{|i| i.artists}.flatten.map{|c| c.name}.select{|u| u.downcase != artist.downcase}
			# puts 'collabs-Array is: '
			# puts collabsArray
		end
	end

	scope :artist_producers, -> {includes(:song_involvements).where( :song_involvements => { :producer => true } )}


end
