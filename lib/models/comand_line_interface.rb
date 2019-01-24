# What do we want to allow our users to do?

def welcome
 puts "IIIIIIIIT'S TIIIIIIIMMMMEEEEEE!"
end

def help
 puts "I accept the following commands:
 - help: displays this message
 - camp: tells you what camp a fighter belongs to
 - weight-class: tells you what weight class a fighter is in
 - best camps: tells you the top 3 best camps for a given weight class
 - camp specialties: tells you about a camp's weight class specialties
 - create fighter: creates a new fighter when given the fighters NAME, NICKNAME, CITY, COUNTRY, HEIGHT(in inches), WEIGHT, WEIGHT CLASS, and CAMP
 - FIGHT: accepts two fighters and determines if they can fight one another
 - delete fighter: removes a fighter from the database
 - exit: terminates the program"
end

def ufc_app
  welcome
  help
 command = ""
 while command
 puts "Please enter a command"
 command = gets.chomp
 case command
   when 'help'
     help
   when 'camp'
     puts "Please enter a fighter's full name"
     fighter_name = gets.chomp.titleize
     puts Camp.find_by(id: Fighter.find_by(name: fighter_name)[:camp_id])[:camp_name]
     break if (anything_else? == 'please exit')
   when 'weight-class'
     puts "Please enter a fighter's full name"
     fighter_name = gets.chomp.titleize
     puts WeightClass.find_by(id: Fighter.find_by(name: fighter_name)[:weight_class_id])[:class_name]
     break if (anything_else? == 'please exit')
   when 'best camps'
     puts "Enter a weight class"
     weight_class_input = gets.chomp.titleize
     top_camps_per_weight_class(weight_class_input)
     break if (anything_else? == 'please exit')
   when 'camp specialties'
     puts "Enter a camp name"
     camp_name = gets.chomp.titleize
     camp_specialties(camp_name)
     break if (anything_else? == 'please exit')
   when 'create fighter'
     puts "Enter the fighter's first and last name"
     nf_name = gets.chomp.titleize
     puts "Enter the fighter's nickname"
     nf_nickname = gets.chomp.titleize
     puts "Enter the fighter's home city"
     nf_city = gets.chomp.titleize
     puts "Enter the fighter's country of origin"
     nf_country = gets.chomp.titleize
     puts "Enter the fighter's height in inches"
     nf_height = gets.chomp.to_i
     puts "Enter the fighter's weight"
     nf_weight = gets.chomp.to_i
     puts "Enter a fighter's weight class"
     nf_weight_class = gets.chomp.titleize
     puts "Enter a fighter's camp"
     nf_camp = gets.chomp.titleize
     new_fighter_weight_class = WeightClass.create(weight: nf_weight, class_name: nf_weight_class)
     new_fighter_camp = Camp.create(camp_name: nf_camp)
     new_fighter = Fighter.create(name: nf_name, nickname: nf_nickname, city: nf_city, country: nf_country, height: nf_height, camp_id: new_fighter_camp.id, weight_class_id: new_fighter_weight_class.id)
     break if (anything_else? == 'please exit')
   when 'FIGHT'
     puts "Please enter a fighter's full name"
     fighter_one = gets.chomp
     fighter_one_weight_class = WeightClass.find_by(id: Fighter.find_by(name: fighter_one)[:weight_class_id])[:class_name]
     puts "Please enter another fighter's full name"
     fighter_two = gets.chomp.titleize
     fighter_two_weight_class = WeightClass.find_by(id: Fighter.find_by(name: fighter_two)[:weight_class_id])[:class_name]
     if fighter_one == fighter_two
       puts "#{fighter_one} would never fight their twin"
     elsif (fighter_one_weight_class == fighter_two_weight_class) && (fighter_one != fighter_two)
        puts "Let's get it on!"
        puts "#{fighter_one} vs. #{fighter_two}"
        fight_odds = rand(10)
        if fight_odds >= 5
          puts "#{fighter_one} is the undisputed #{fighter_one_weight_class} champion of the world"
        else
          puts "#{fighter_two} is the undisputed #{fighter_two_weight_class} champion of the world"
        end
     elsif fighter_one_weight_class != fighter_two_weight_class
       puts "These fighters are not in the same weight class"
     end
     break if (anything_else? == 'please exit')
   when 'delete fighter'
     puts "Choose a column header to choose a fighter to delete"
     column = gets.chomp
     puts "Enter the fighter's #{column} to delete that fighter"
     some_instance = gets.chomp
     destroy_fighter_by(column, some_instance)
     break if (anything_else? == 'please exit')
   when 'exit'
     break
   else
     puts "Please enter a valid command"
     help
   end
 end
end

#
# def camps(fighter)
#
# end
