require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

techcorp = Startup.new("Techcorp", "Alice Apple", "fintech")
medcorp = Startup.new("Medcorp", "Bill Bruce", "medtech")
legalcorp = Startup.new("Legalcorp", "Alice Apple", "legaltech")

barney = VentureCapitalist.new("Barney Bourne", 1000000000.99)
marissa = VentureCapitalist.new("Marissa Mayer", 5000000000.99)
bill = VentureCapitalist.new("Bill Gurley", 100000000.99)

round1 = FundingRound.new(techcorp, barney, "Series A", 5000000.00)
round2 = FundingRound.new(techcorp, bill, "Series B", 10000000.00)
round2_5 = FundingRound.new(techcorp, bill, "Series C", 20000000.00)
round3 = FundingRound.new(medcorp, barney, "Series B", 15000000.00)
round4 = FundingRound.new(medcorp, barney, "Series C", 25000000.00)

binding.pry
#leave this here to ensure binding.pry isn't the last line
