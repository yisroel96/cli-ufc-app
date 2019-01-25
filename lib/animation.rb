def animation_solo
  12.times do
  i = 1
    while i < 13
      print "\033[2J"
      File.foreach("hidden/ascii_animation/#{i}.rb") { |f| puts f }
      sleep(0.05)
      i += 1
    end
  end
end
