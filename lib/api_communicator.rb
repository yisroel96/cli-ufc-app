# def camps(fighter_name)
#   puts "Please enter a fighter's full name"
#   puts Camp.find_by(id: Fighter.find_by(name: fighter_name)[:camp_id])[:camp_name]
# end
#
# def weight_class(fighter_name)
#   puts "Please enter a fighter's full name"
#   fighter_name = gets.chomp
#   fighters_weight_class = WeightClass.find_by(id: Fighter.find_by(name: fighter_name)[:weight_class_id])[:class_name]
#   puts fighters_weight_class
# end
#
def camp_specialties(camp_name)
  camp_instances = Camp.select{|camp| camp.camp_name == camp_name}
  camp_instance_ids = camp_instances.map {|camp| camp.id }
  camp_array = []
  camp_instance_ids.each do |c_id|
    camp_array << Fighter.find_by(camp_id: c_id)
  end
  weight_class_array = []
  camp_array.each do |wc_id|
    weight_class_array << WeightClass.find_by(id: wc_id)
  end
  weight_class_hash = Hash.new(0)
  weight_class_array.each do |wc|
    weight_class_hash[wc.class_name] += 1
  end
   camps_weight_class_specialty = weight_class_hash.max_by{|weight_class_name, wc_name_incrementation| wc_name_incrementation}[0]
   puts camps_weight_class_specialty
end

def anything_else?
  puts "Anything else you'd like to know?"
  puts "[Y/N]"
  y_or_n = gets.chomp.upcase
  if y_or_n == 'Y'
    help
  elsif y_or_n == 'N'
    return 'please exit'
  else
    puts "Please enter y or n"
  end
end
