require 'rest-client'
require 'json'
require 'pry'

Fighter.destroy_all
WeightClass.destroy_all
Camp.destroy_all

og = RestClient.get('https://script.google.com/macros/s/AKfycbw3zy6ZcIUr_d00ZJ4gJvn7_ZrxWW2wmclY-8_suJeWJlSB3Dln/exec')
ufc_hash = JSON.parse(og)["user"]
ufc_hash.each do |fighter|
  Fighter.create!(fighter)
end

og_wc = RestClient.get('https://script.google.com/macros/s/AKfycbyHpk1WNjaNGeMFcvgNUq8olBsBhhHwLeWjX8LAneM5TU53yoEv/exec')
ufc_hash_wc = JSON.parse(og_wc)["user"]
ufc_hash_wc.each do |wc|
  WeightClass.create!(wc)
end

og_camp = RestClient.get('https://script.google.com/macros/s/AKfycbx0FRss5QKzS7BDPLL45suaQbAdiwk_dFeQSeGgBQSVxz7KaqE/exec')
ufc_hash_camp = JSON.parse(og_camp)["user"]
ufc_hash_camp.each do |camp|
  Camp.create!(camp)
end
#binding.pry
# 0
