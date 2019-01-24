require 'rest-client'
require 'json'
require 'pry'

Fighter.destroy_all
WeightClass.destroy_all
Camp.destroy_all

og = RestClient.get('https://script.googleusercontent.com/macros/echo?user_content_key=agz7b2JTBMDYhw-jYgZJJ54X_VNhNWk-se2KK5rq12Dk3ganuH3auz429vq4S_qmKW0emWTJLhkeZ_5mWai2Za3mvtD_Wqjum5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnPsHbo7_pNEtT3vLX2y9ZmltLP4YI_OoZHoMd7uFWAK5DhZg0YL3efvxFOT2B0blggegiHP2Ryw5&lib=MagvpSEBNFRfA8U-lFEyQPWiPUb_TAeKa')
ufc_hash = JSON.parse(og)["user"]
ufc_hash.each do |fighter|
  Fighter.create!(fighter)
end

og_wc = RestClient.get('https://script.googleusercontent.com/macros/echo?user_content_key=-g8OQJDRXkfTKI7vZNtz55bTMNiivaVk45m1PREQRU7fiI3L--x6Nt5j9tPtQ3z7HzjMcQDv3F-pTV82kBmdjCUJrBOkWQDlm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnBdYbYxA2euhcfJjysFbJHQBpYrD1FIf1l53K0fS57EbpIIjIlZ3KnCeZqmfuGwtHiK1xelrpsbz&lib=MAnlMuLHiss3hP5QJhTzeYGiPUb_TAeKa')
ufc_hash_wc = JSON.parse(og_wc)["user"]
ufc_hash_wc.each do |wc|
  WeightClass.create!(wc)
end

og_camp = RestClient.get('https://script.googleusercontent.com/macros/echo?user_content_key=ub0kygIpZZrSlzjq-c9Km4VS0uMXDzRtxWX_OO2x27oeLUQkmrDiaebjM1BkhtNJIb-5gV-AuA5_svYyxs72vyswmmMuxCrEm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnK_KUlfgIhbGQs74yo7biBJapYh2cWz6uhDeDrqg8gqFEpwNMFeYR0kpkBjK3YL8sqOIp7sEUsJ2&lib=MbjqLm5ZlC2DObmZf3rh-_QyfUjkjTl6r')
ufc_hash_camp = JSON.parse(og_camp)["user"]
ufc_hash_camp.each do |camp|
  Camp.create!(camp)
end
#binding.pry
# 0
