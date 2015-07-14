json.array!(@song_involvements) do |song_involvement|
  json.extract! song_involvement, :id, :song_id, :artist_id, :primary, :featured, :producer
  json.url song_involvement_url(song_involvement, format: :json)
end
