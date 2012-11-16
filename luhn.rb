# Luhn Algorithm
# Austin.RB Kata Nov 2012
# See http://www.rubyquiz.com/quiz122 for full info

puts "Enter Credit Card Number: "
cc = gets

# reverse the card number and split each number
luh = cc.reverse.split(//)
luh.map! { |x| x.to_i }
copy = luh

# for each odd index, mult by 2
luh.each_with_index do |num, index|                                                                  
  if index.odd?
    copy[index] = num*2
  end
end

# sum all numbers = Luhn sum
sum = copy.inject{ |sum, x| sum + x }

puts "Luhn Sum: #{sum}"
