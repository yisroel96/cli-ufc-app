def camps(fighter)
  puts "Please enter a fighter's full name"
  camps_id = Fighter.find_by(name: fighter)[:camp_id]
  Camps.find_by(id: camps_id)

end

def animation
   10.times do
  i = 1
  while i < 13
    print "\033[2J"
    File.foreach("lib/ascii_boxer/#{i}.rb") { |f| puts f }
    sleep(0.05)
    i += 1
    end
  end
end
