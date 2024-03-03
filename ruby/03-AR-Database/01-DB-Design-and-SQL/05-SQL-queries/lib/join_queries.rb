require 'sqlite3'

def detailed_tracks(db)
  # TODO: return the list of tracks with their album and artist.
  query = <<~SQL
    SELECT t.name, al.title, ar.name
    FROM tracks t
    JOIN albums al ON al.id = t.album_id
    JOIN artists ar ON ar.id = al.artist_id
  SQL
  db.execute(query)
end

def stats_on(db, genre_name)
  # TODO: For the given category of music, return the number of tracks and the average song length (as a stats hash)
  query = <<~SQL
    SELECT COUNT(t.id), ROUND(AVG(milliseconds) / 60000, 2)
    FROM tracks t
    JOIN genres g ON g.id = t.genre_id
    WHERE g.name = ?
  SQL
  data = db.execute(query, genre_name).flatten
  { category: genre_name, number_of_songs: data[0], avg_length: data[1] }
end

def top_five_artists(db, genre_name)
  # TODO: return list of top 5 artists with the most songs for a given genre.
  query = <<~SQL
    SELECT ar.id, ar.name, COUNT(t.id) AS c
    FROM tracks t
    JOIN albums al ON al.id = t.album_id
    JOIN artists ar ON ar.id = al.artist_id
    JOIN genres g ON g.id = t.genre_id
    WHERE g.name = ?
    GROUP BY ar.id
    ORDER BY c DESC
    LIMIT 5
  SQL
  db.execute(query, genre_name)
end
