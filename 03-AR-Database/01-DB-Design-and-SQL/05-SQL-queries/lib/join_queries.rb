require 'sqlite3'

def detailed_tracks(db)
  # TODO: return the list of tracks with their album and artist.
  query = "SELECT tracks.name, albums.title, artists.name FROM tracks JOIN albums ON tracks.album_id =" \
          "albums.id JOIN artists ON albums.artist_id = artists.id;"
  db.execute(query)
end

def stats_on(db, genre_name)
  query = "SELECT avg(milliseconds), genres.name, COUNT(*) FROM tracks JOIN genres ON tracks.genre_id = genres.id " \
          "WHERE genres.name = '#{genre_name}';"
  result = db.execute(query).first
  {
    category: result[1],
    number_of_songs: result[2],
    avg_length: (result[0] / 1000.0 / 60.0).round(2)
  }
end

def top_five_artists(db, genre_name)
  # TODO: return list of top 5 artists with the most songs for a given genre.
  query = "SELECT artists.id, artists.name, COUNT(*) FROM artists JOIN albums ON artists.id = albums.artist_id JOIN " \
          "tracks ON albums.id = tracks.album_id JOIN genres ON tracks.genre_id = genres.id WHERE " \
          "genres.name = '#{genre_name}' GROUP BY artists.name ORDER BY COUNT(*) DESC LIMIT 5;"
  db.execute(query)
end
