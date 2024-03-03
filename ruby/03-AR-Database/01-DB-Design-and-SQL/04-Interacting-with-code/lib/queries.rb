require 'sqlite3'

def artist_count(db)
  # TODO: use `db` to execute an SQL query against the database.
  db.execute("SELECT * FROM artists").length
end

def number_of_rows(db, table_name)
  # TODO: count number of rows in table table_name
  db.execute("SELECT * FROM #{table_name}").length
end

def sorted_artists(db)
  # TODO: return array of artists' names sorted alphabetically
  db.execute("SELECT name n FROM artists ORDER BY n").map { _1[0] }
end

def love_tracks(db)
  # TODO: return array of love songs' names
  db.execute("SELECT name FROM tracks WHERE name LIKE '%love%'").map { _1[0] }
end

def long_tracks(db, min_length)
  # TODO: return an array of tracks' names verifying: duration > min_length (minutes) sorted by length (ascending)
  query = <<~SQL
    SELECT name
    FROM tracks
    WHERE milliseconds > #{min_length * 60_000}
    ORDER BY milliseconds
  SQL
  db.execute(query).map { _1[0] }
end
