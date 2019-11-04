require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

facebook = Startup.new("Facebook", "Mark Zuckerberg", "Social Media")
instagram = Startup.new("Instagram", "Kevin Systrom", "Photography")
apple = Startup.new("Apple", "Steve Jobs", "Computers")
snapchat = Startup.new("Snapchat", "Evan", "Social Media")


chris_sacca = VentureCapitalist.new("Chris Sacca", 3000000000)
mark_cuban = VentureCapitalist.new("Mark Cuban", 5000)
daymond_john = VentureCapitalist.new("Daymond John", 500)


fr1 = FundingRound.new(facebook, mark_cuban, "Angel", 1000000)
fr2 = FundingRound.new(instagram, daymond_john, "Series A", 200)
fr3 = FundingRound.new(apple, chris_sacca, "Series A", 400)
fr4 = FundingRound.new(facebook, chris_sacca, "Series B", 6000)
fr4 = FundingRound.new(snapchat, chris_sacca, "Angel", 10000)



binding.pry
0 #leave this here to ensure binding.pry isn't the last line