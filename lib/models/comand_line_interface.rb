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

def exit_app
  puts "Thanks for fighting."
end

def user_selection
 command = ""
 while command
 puts "Please enter a valid command"
 command = gets.chomp
 case command
   when 'help'
     help
   when 'camps'
     camps(fighter)
   when 'weight-class'
     weight_class(fighter)
   when 'camp-spec'
     camp_spec(camp_name)
   when 'FIGHT'
     fight(fighter_one, fighter_two)
   when 'exit'
     exit_app
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
