require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

s1 = Startup.new("Co 1", "Steve", "Finance")
s2 = Startup.new("Co 2", "Frank", "CPGs")
s3 = Startup.new("Co 3", "Susan", "Tech")

vc1 = VentureCapitalist.new("VC 1", 10000000000)
vc2 = VentureCapitalist.new("VC 2", 40000000)
vc3 = VentureCapitalist.new("VC 3", 8000000)

fr1 = FundingRound.new(s1, vc3, "Angel", 50000)
fr2 = FundingRound.new(s2, vc1, "Series D", 999999)
fr3 = FundingRound.new(s3, vc2, "Series A", 200000)


binding.pry
"endofpry"