require_relative '../config/environment'


puts "Already have an account? [Y/N]"
init_input = gets.chomp.upcase
if init_input == 'Y'
  log_in
else
  sign_up
end 

ufc_app

puts "Thanks for fighting!"


# binding.pry
