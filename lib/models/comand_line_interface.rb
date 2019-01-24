# What do we want to allow our users to do?

def welcome
 puts "IIIIIIIIT'S TIIIIIIIMMMMEEEEEE!"
end

def help
 puts "I accept the following commands:
 - help: displays this message
 - camps: tells you what camp a fighter belongs to
 - weight-class: tells you what weight class a fighter is in
 - camp-spec: tells you about a camp's weight class specialties
 - FIGHT: accepts two fighters and determines if they can fight one another
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
   when 'camps'
     puts "Please enter a fighter's full name"
     fighter_name = gets.chomp
     puts Camp.find_by(id: Fighter.find_by(name: fighter_name)[:camp_id])[:camp_name]
     break if (anything_else? == 'please exit')
   when 'weight-class'
     puts "Please enter a fighter's full name"
     fighter_name = gets.chomp
     puts WeightClass.find_by(id: Fighter.find_by(name: fighter_name)[:weight_class_id])[:class_name]
     break if (anything_else? == 'please exit')
   when 'camp-spec'
     puts "Enter a camp name"
     camp_name = gets.chomp
     camp_specialties(camp_name)
     break if (anything_else? == 'please exit')
   when 'FIGHT'
     puts "Please enter a fighter's full name"
     fighter_one = gets.chomp
     fighter_one_weight_class = WeightClass.find_by(id: Fighter.find_by(name: fighter_one)[:weight_class_id])[:class_name]
     puts "Please enter another fighter's full name"
     fighter_two = gets.chomp
     fighter_two_weight_class = WeightClass.find_by(id: Fighter.find_by(name: fighter_two)[:weight_class_id])[:class_name]
     if fighter_one == fighter_two
       puts "#{fighter_one} would never fight their twin"
     elsif (fighter_one_weight_class == fighter_two_weight_class) && (fighter_one != fighter_two)
        puts "Let's get it on!"
     else
       puts "These fighters are not in the same weight class"
     end
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
