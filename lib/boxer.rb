def animation
   10.times do
  i = 1
  while i < 13
    print "\033[2J"
    File.foreach("lib/ascii_boxer/#{i}.rb") { |f| puts f }
    sleep(0.05)
    i += 1
    end
  end
end

animation
