# require_relative "dungeon"

# #character creation method
# #ask for name, age, give class options along with description
# #short bio
# #classes give pre set inventory

def character_creation(db, name, age, c_class)
  puts "Enter Character Name"
  name = gets.chomp
  puts "Enter Character Age"
  age = gets.chomp
  puts "Enter Character Class"
  db.execute("INSERT INTO characters (name, age, c_class) VALUES (?, ?, ?)", [name, age, c_class])
end


# #retrieve data for character name
# #retrive party data

character = db.execute("SELECT * FROM characters")
characters.each do |character|
 puts "#{character['name']} is #{character['age']}"
end

