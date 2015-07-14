json.array!(@songs) do |song|
  json.extract! song, :id, :title, :song_link
  json.url song_url(song, format: :json)
end
