require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

uber = Startup.new("Uber", "Jack", "Taxi")
lyft = Startup.new("Lyft", "Robert", "Taxi")
amazon = Startup.new("Amazon", "Ben", "Shopping")
ebay = Startup.new("eBay", "Rachel", "Shopping")
iheart = Startup.new("iHeartRadio", "Andy", "Music")

buffett = VentureCapitalist.new("Buffett", 120.5) # in billions
lynch = VentureCapitalist.new("Lynch", 23.35)
soros = VentureCapitalist.new("Soros", 0.955)
bogle = VentureCapitalist.new("Bogle", 0.879)

a = FundingRound.new(uber, buffett, "round1", 1.25)
b = FundingRound.new(uber, lynch, "round2", 2.75)
c = FundingRound.new(uber, buffett, "round3", 5.55)
d = FundingRound.new(lyft, soros, "round1", 0.25)
e = FundingRound.new(lyft, bogle, "round2", 0.30)
f = FundingRound.new(amazon, soros, "round1", 0.15)
g = FundingRound.new(amazon, buffett, "round2", 3.75)
h = FundingRound.new(ebay, bogle, "round1", 0.09)
i = FundingRound.new(ebay, lynch, "round2", 3.15)
j = FundingRound.new(ebay, lynch, "round3", 1.85)
k = FundingRound.new(iheart, soros, "round1", 0.125)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line