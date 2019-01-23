def camps(fighter)
  puts "Please enter a fighter's full name"
  camps_id = Fighter.find_by(name: fighter)[:camp_id]
  Camps.find_by(id: camps_id)

end
