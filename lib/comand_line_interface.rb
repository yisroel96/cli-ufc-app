# What do we want to allow our users to do?

def welcome
  animation_intro
  puts " "
  puts "IIIIIIIIT'S TIIIIIIIMMMMEEEEEE!"
end

def sign_up
  puts "please enter a unique username"
  user_name_attempt = gets.chomp.downcase
  user_id_array = User.all.map{|user_attr| user_attr.id}
  new_user = User.find_or_create_by(user_name: user_name_attempt)
  if user_id_array.include?(new_user[:id])
    puts "That username already exists, please try again"
    sign_up
  else
    puts "Please enter a password"
    user_password_attempt = gets.chomp.downcase
    user_password = Password.create(password_entry: user_password_attempt, user_id: new_user[:id])
  end
end

def log_in
  puts "please enter your username"
  username_entry_one = gets.chomp.downcase
  if User.find_by(user_name: username_entry_one) == nil
    puts "please enter a valid username"
    log_in
  else
    puts "please enter your password"
    password_entry_one = gets.chomp.downcase
    if Password.find_by(password_entry: password_entry_one)[:user_id] != User.find_by(user_name: username_entry_one)[:id]
      puts "please try your log-in credentials again"
      log_in

    end
  end
end


def help
 puts "********************************************************************
 I accept the following commands:
 - help: displays this message
 - camp: tells you what camp a fighter belongs to
 - weight-class: tells you what weight class a fighter is in
 - update weight: updates a given fighter's weight and weight class
 - FIGHT: accepts two fighters and determines if they can fight one another
 - best camps: tells you the top 3 best camps for a given weight class
 - camp specialties: tells you about a camp's weight class specialties
 - create fighter: creates a new fighter when given the fighters NAME, NICKNAME, CITY, COUNTRY, HEIGHT(in inches), WEIGHT, WEIGHT CLASS, and CAMP
 - delete fighter: removes a fighter from the database
 - log out: logs out of your account
 - exit: terminates the program
 ********************************************************************"
end

def ufc_app
  welcome
  help
  command = ""
  while command
  puts "Please enter a command"
  puts "**********************"
  command = gets.chomp.downcase
  case command
   when 'help'
     help
   when 'camp'
     puts "Please enter a fighter's full name"
     fighter_name = gets.chomp
     puts "**********************************"
     if Fighter.find_by(name: fighter_name) != nil
       puts Camp.find_by(id: Fighter.find_by(name: fighter_name)[:camp_id])[:camp_name]
     else
       ufc_app
     end
     break if (anything_else? == 'please exit')
   when 'weight-class'
     puts "Please enter a fighter's full name"
     fighter_name = gets.chomp
     puts "**********************************"
     if Fighter.find_by(name: fighter_name) != nil
       puts WeightClass.find_by(id: Fighter.find_by(name: fighter_name)[:weight_class_id])[:class_name]
     else
       ufc_app
     end
      break if (anything_else? == 'please exit')
   when 'update weight'
     puts "Enter a fighter's full name"
     #wc_change_name, new_weight, new_wc
     wc_change_name = gets.chomp
     puts "Enter #{wc_change_name}'s updated weight"
     new_weight = gets.chomp.to_i
     puts "Enter #{wc_change_name}'s updated weight class"
     new_wc = gets.chomp.titleize
     update_weight(wc_change_name, new_weight, new_wc)
     break if (anything_else? == 'please exit')
   when 'best camps'
     puts "Enter a weight class"
     weight_class_input = gets.chomp.titleize
     puts "********************"
     if WeightClass.find_by(class_name: weight_class_input) != nil
       top_camps_per_weight_class(weight_class_input)
     else
       ufc_app
     end
     break if (anything_else? == 'please exit')
   when 'camp specialties'
     puts "Enter a camp name"
     camp_name = gets.chomp
     puts "*****************"
     if Camp.find_by(camp_name: camp_name) != nil
       camp_specialties(camp_name)
     else
       ufc_app
     end
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
     puts "#{Fighter.find_by(name: nf_name)[:name]} is a #{WeightClass.find_by(class_name: nf_weight_class)[:class_name]} fighting out of #{Camp.find_by(camp_name: nf_camp)[:camp_name]}."
     break if (anything_else? == 'please exit')
   when 'fight'
     puts "Please enter a fighter's full name"
     fighter_one = gets.chomp
     if Fighter.find_by(name: fighter_one) != nil
       fighter_one_weight_class = WeightClass.find_by(id: Fighter.find_by(name: fighter_one)[:weight_class_id])[:class_name]
     else
       ufc_app
     end
     puts "Please enter another fighter's full name"
     fighter_two = gets.chomp
     if Fighter.find_by(name: fighter_two) != nil
       fighter_two_weight_class = WeightClass.find_by(id: Fighter.find_by(name: fighter_two)[:weight_class_id])[:class_name]
     else
       ufc_app
     end
     if fighter_one == fighter_two
       puts "#{fighter_one} would never fight themselves"
     elsif (fighter_one_weight_class == fighter_two_weight_class) && (fighter_one != fighter_two)
        puts "Let's get it on!"
        puts "#{fighter_one} vs. #{fighter_two}"
        animation_solo
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
     puts "Choose a fighter's attribute to choose a fighter to delete"
     column = gets.chomp
     puts "Enter the fighter's #{column} to delete that fighter"
     some_instance = gets.chomp
     destroy_fighter_by(column, some_instance)
     animation_duo
     puts " "
     puts "Your Fighter suffered a KO"
     break if (anything_else? == 'please exit')
   when 'log out'
     break
   when 'exit'
     break
   else
     puts "Please enter a valid command"
     help
   end
 end
end
