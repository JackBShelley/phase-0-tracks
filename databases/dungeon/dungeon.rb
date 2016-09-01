#require sqlite, other ruby files

require_relative "character"
require 'sqlite3'

#create sqlite database for user info
#store name, age, class, inventory, recent actions
#class, inventory, and recent actions relate to other tables

db = SQLite3::Database.new("dungeon.db")
db.results_as_hash = true

# learn about fancy string delimiters

create_table = <<-SQLITE3
  CREATE TABLE IF NOT EXISTS characters(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    age INT,
    class VARCHAR(255)
  )

  CREATE TABLE IF NOT EXISTS classes(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    description VARCHAR(255)
  )

  CREATE TABLE IF NOT EXISTS inventory(
    id INTEGER PRIMARY KEY,
    item VARCHAR(255),
    description VARCHAR(255)

  )
SQLITE3

db.execute(create_table)

thing = "swag"
p thing

#dice method
#roll d4, d6, d8, d10, d12, d20 (allow multiple rolls and print message)
#store last roll



#allow character action input, store last 3 actions
