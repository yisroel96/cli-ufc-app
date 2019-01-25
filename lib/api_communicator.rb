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

def top_camps_per_weight_class(weight_class_input)
  weight_class_instances = WeightClass.select{|wc_attr| wc_attr.class_name == weight_class_input}
  weight_class_instance_ids = weight_class_instances.map {|weight_class| weight_class.id }
  weight_class_array = []
  weight_class_instance_ids.each do |wc_id|
    weight_class_array << Fighter.find_by(weight_class_id: wc_id)
  end
  camp_array = []
  weight_class_array.each do |c_id|
    camp_array << Camp.find_by(id: c_id)
  end
  camp_hash = Hash.new(0)
  camp_array.each do |c|
    camp_hash[c.camp_name] += 1
  end
  # best_camps = camp_hash.max_by {|camps, value| value}[0]
  best_camps = ((camp_hash.sort_by{|key, value| value}.reverse).to_h).keys[0..2]
  puts best_camps
end

def destroy_fighter_by(column, some_instance)
  instance_of_fighter_id = Fighter.find_by(column => some_instance)[:id]
  Fighter.where(column => some_instance).destroy_all
  WeightClass.where(id: instance_of_fighter_id).destroy_all
  Camp.where(id: instance_of_fighter_id).destroy_all
end

def update_weight(wc_change_name, new_weight, new_wc)
  WeightClass.update((Fighter.find_by(name: wc_change_name)[:id]), weight: new_weight, class_name: new_wc)
end

def anything_else?
  puts "*********************************"
  puts "Return to main menu?"
  puts "[Y/N]"
  y_or_n = gets.chomp.upcase
  if y_or_n == 'Y'
    help
  elsif y_or_n == 'N'
    return 'please exit'
  else
    puts "Please enter y or n"
    anything_else?
  end
end
