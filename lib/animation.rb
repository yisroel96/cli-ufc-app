def animation_solo
  9.times do
  i = 1
    while i < 13
      print "\033[2J"
      File.foreach("hidden/ascii_animation/#{i}.rb") { |f| puts f }
      sleep(0.05)
      i += 1
    end
  end
end

def animation_duo
  6.times do
  i = 1
    while i < 22
      print "\033[2J"
      File.foreach("hidden/ascii_animation_2/#{i}.rb") { |f| puts f }
      sleep(0.03)
      i += 1
    end
  end
end

def animation_ufc
  1.times do
  i = 1
    while i < 2
      print "\033[2J"
      File.foreach("hidden/ufc/#{i}.rb") { |f| puts f }
      sleep(2.0)
      i += 1
    end
  end
end

# def animation_belt
#   1.times do
#   i = 1
#     while i < 2
#       print "\033[2J"
#       File.foreach("hidden/belt/#{i}.rb") { |f| puts f }
#       sleep(2.0)
#       i += 1
#     end
#   end
# end
