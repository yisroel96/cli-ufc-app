require_relative '../config/environment'

puts "Welcome to the UFC"
puts " "
def account?
  puts "Already have an account? [Y/N]"
    init_input = gets.chomp.upcase
    if init_input == 'Y'
      log_in
    elsif init_input == 'Q'
          exit!
    elsif init_input == 'N'
      sign_up
    else
      account?
  end
end
account?
ufc_app

puts "Thanks for fighting!"


# binding.pry
