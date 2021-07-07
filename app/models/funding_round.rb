class FundingRound
    attr_reader :startup, :venture_capitalist
    attr_accessor :type, :investment

    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist 
        @type = type
        @investment = investment

        @@all << self
    end

    def self.all
        @@all
    end

    def investment
        if @investment < 0
            @investment == 0
        else @investment
        end
    end
end
