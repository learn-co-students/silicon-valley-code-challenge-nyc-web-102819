require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#(name, founder, domain)
lyft = Startup.new("Lyft", "Jen", "Travel")
uber = Startup.new("Uber", "Jon", "Travel")
mealpal = Startup.new("MealPal", "Mom", "Food")

joe = VentureCapitalist.new("Joe", 100000)
bimmy = VentureCapitalist.new("Bimmy", 2000)
jimmy = VentureCapitalist.new("Jimmy", 30000000)
timmy = VentureCapitalist.new("Timmy", 40000)
kimmy = VentureCapitalist.new("Kimmy", 3600000000)

FR1 = FundingRound.new(mealpal, kimmy, "A", 2340)
FR2 = FundingRound.new(uber, timmy, "A", 3847.5)
FR3 = FundingRound.new(uber, kimmy, "B", 973849)
FR4 = FundingRound.new(lyft, jimmy, "C", 87937.48)
FR5 = FundingRound.new(mealpal, bimmy, "B", 36826.4)
FR6 = FundingRound.new(mealpal, kimmy, "C", 40)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line