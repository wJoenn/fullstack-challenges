## Contexte et objectifs

Le moment est venu d’utiliser le code Ruby pour interagir avec la base de données `jukebox`. Pour cela, on a besoin d'une gem appelée [sqlite3](http://rubygems.org/gems/sqlite3).

Pour installer la gem sur ton ordinateur, exécute la commande suivante dans le terminal :

```bash
gem install sqlite3
```

L’objectif de cet exercice est de communiquer avec la base de données **depuis le code Ruby**.

## Spécifications

👉 **IMPORTANT** : Chaque méthode prend un argument `db`, qui est une instance de `SQLite3::Database` sur laquelle on peut appeler la méthode `execute`. Cette `db` est **créée par le test et passée à la méthode**. Inutile d’en créer une toi-même pour faire plaisir à `rake`. Ta méthode ressemblera à ça :

```ruby
def the_method(db)
 results = db.execute("YOUR SQL QUERY")
 # résultats dans un Array (lignes) d’Arrays (colonnes)
 p results # Vérifie ce que tu obtiens ! Ne joue pas aux devinettes !

 # Puis tu auras besoin de retourner quelque chose.
 return ?
end
```

👉 Pour tester ton code avec `irb` (ou dans le fichier `lib/queries.rb`), tu auras besoin de créer toi-même `db`.

```ruby
# lib/queries.rb
require "sqlite3"
db = SQLite3::Database.new("lib/db/jukebox.sqlite")
rows = db.execute("SELECT * FROM artists LIMIT 3")
# => [[1, "AC/DC"], [2, "Accept"], [3, "Aerosmith"]]
```

Tu peux ensuite importer tes méthodes de requête avec :

```ruby
require_relative "lib/queries"
artist_count(db)
# => [...]
```

Ouvre le fichier `lib/queries.rb` pour répondre aux questions suivantes. N’oublie pas de regarder dans la base de données en exécutant `sqlite3 lib/db/jukebox.sqlite` dans le terminal ou utilise l’un des outils mentionnés dans l’exercice précédent (SQLite Pro, SQLStudio ou SQLite Browser).

Il y a cinq méthodes à implémenter :

- Combien de lignes la table `artists` contient-elle ?
- Combien de lignes chaque table contient-elle (méthode générique) ?
- Retourne la liste de tous les artistes classés par nom (par ordre alphabétique). **Astuce :** utilise le filtre SQL `ORDER BY`.
- Trouve toutes les chansons d’amour (à savoir les chansons dont le titre contient le mot "love" **n'importe où**). **Astuce :** utilise les mots-clés SQL `WHERE` et `LIKE`.
- Retourne toutes les chansons dont la durée est supérieure à une durée donnée et trie-les. **Astuce :** tu peux utiliser l’opérateur de comparaison `>` dans SQL.

## Conseils

Les requêtes SQL ont tendance à être longues, notamment si tu commences à utiliser `WHERE` ou `JOIN`. En Ruby, tu peux utiliser la syntaxe [HEREDOC](https://www.rubyguides.com/2018/11/ruby-heredoc/) pour écrire des strings à **plusieurs lignes** :

```ruby
# Trouve les 3 premiers artistes avec la lettre `Z` dans leur nom.
query = <<-SQL
 SELECT * FROM artists
 WHERE name LIKE "%Z%"
 ORDER BY name
 LIMIT 3
SQL
rows = db.execute(query)
```

Tu remarqueras que ton éditeur de texte comprend Heredoc et que la syntaxe en surbrillance est en fait du SQL dans le fichier Ruby !

## Ressources

- [Commandes SQL](http://www.sqlcommands.net/)
- [Cours en 🇫🇷 sur `SELECT`](http://sqlpro.developpez.com/cours/sqlaz/select/#L3.4)

## Outils

Tu as découvert ces outils dans l’exercice précédent. Utilise-les !

- [SQLite Pro (macOS uniquement, logiciel payant mais la version d’essai semble illimitée)](https://www.sqlitepro.com/)
- [SQLStudio (gratuit)](http://sqlitestudio.pl/)
- [SQLite Browser (gratuit)](http://sqlitebrowser.org/)
