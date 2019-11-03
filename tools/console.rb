require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

google = Startup.new("Google", "Larry Page", "www.google.com")
facebook = Startup.new("Facebook", "Mark Zuckerberg", "www.facebook.com")
amazon = Startup.new("Amazon", "Jeff Bezos", "www.amazon.com")

bob = VentureCapitalist.new("Bob Gold", 9900000000000)
steve = VentureCapitalist.new("Steve Silver", 6000000000)
jon = VentureCapitalist.new("Jon Doe", 500)

fund1 = FundingRound.new(facebook, bob, "Angel", 7000000)
fund2 = FundingRound.new(google, bob, "Series A", 22222222)
fund3 = FundingRound.new(google, steve, "Seed", 4000)
fund4 = FundingRound.new(amazon, bob, "Series B", 10000)
fund5 = FundingRound.new(facebook, steve, "Angel", 9999999)
fund6 = FundingRound.new(amazon, jon, "Angel", -4)








binding.pry
0 #leave this here to ensure binding.pry isn't the last line