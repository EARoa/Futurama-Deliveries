require './shipment' #.rb extention is optional
require 'pry'


puts "ohai, jwo"
puts "\r"

money = 0
fry_bonus = 0
earthtrips = 0
earthmoney = 0

amy_bonus = 0
marstrips = 0
marsmoney = 0

bender_bonus = 0
uranustrips = 0
uranusmoney = 0

leela_bonus = 0
leelatrips = 0
othermoney = 0

venustotal = 0
jupitertotal = 0
saturntotal = 0
neptunetotal = 0
plutototal = 0


open("planet_express_logs").each do |line|

  values_array = line.chomp.split(",")

shipment = Shipment.new
shipment.destination      = values_array[0]
shipment.what_got_shipped = values_array[1]

# binding.pry # => Stop here

shipment.how_many         = values_array[2].to_i
shipment.money            = values_array[3].to_i
#add shipment to money array
money += shipment.money


case shipment.destination
when "Earth"
  fry_bonus += shipment.money * 0.10
  earthtrips +=1
  earthmoney += shipment.money
when "Mars"
  amy_bonus += shipment.money * 0.10
  marstrips +=1
  marsmoney += shipment.money
when "Uranus"
  bender_bonus += shipment.money * 0.10
  uranustrips +=1
  uranusmoney += shipment.money
else
  leela_bonus += shipment.money * 0.10
  leelatrips +=1
  othermoney += shipment.money
end


case shipment.destination
when "Jupiter"
  jupitertotal += shipment.money
when "Venus"
    venustotal += shipment.money
when "Saturn"
      saturntotal += shipment.money
when "Pluto"
      plutototal += shipment.money
end


end

#puts "The last shipment is #{shipment.inspect}"

puts "How much money did we make this week?"
puts "Money: $#{money}"

puts "\r" # line break command

puts "Bonus each person made"
puts "Fry: $#{fry_bonus}"
puts "Amy: $#{amy_bonus}"
puts "Bender: $#{bender_bonus}"
puts "Leela: $#{leela_bonus}"

puts "\r"

puts "Trips each person made:"
puts "Fry did #{earthtrips} trips"
puts "Amy did #{marstrips} trips"
puts "Bender did #{uranustrips} trips"
puts "Leela did #{leelatrips} trips"


puts "\r"

puts "Money made per planet"

puts "Earth had #{earthmoney}"
puts "Mars had #{marsmoney}"
puts "Uranus had #{uranusmoney}"


puts "Pluto had #{plutototal}"
puts "Saturn had #{saturntotal}"

puts "Jupiter had #{jupitertotal}"
