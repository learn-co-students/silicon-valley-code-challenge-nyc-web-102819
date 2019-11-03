require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

start1 = Startup.new("joe's startup", "joe", "facebook")
start2 = Startup.new("jame's startup", "james", "udemy")
start3 = Startup.new("jame's startup", "james", "udemy")
venture1 = VentureCapitalist.new("joes dad", 10000000)
venture2 = VentureCapitalist.new("james dad", 1000000001)
venture3 = VentureCapitalist.new("jemima", 500000)
funding1 = FundingRound.new(start1, venture1, "type A", 500000)
funding2 = FundingRound.new(start2, venture2, "type B", 300000)
funding3 = FundingRound.new(start2, venture1, "type A", 10000)
funding3 = FundingRound.new(start2, venture3, "type A", 500)




binding.pry
0 #leave this here to ensure binding.pry isn't the last line