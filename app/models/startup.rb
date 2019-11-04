class Startup
    attr_accessor :name
    attr_reader :founder, :domain
    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(name, domain)
        @name = name
        @domain = domain
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def funding_rounds 
        FundingRound.all.select do |round|
            round.startup == self
        end
    end

    def num_funding_rounds
        funding_rounds.length
    end

    def total_funds
        funding_rounds.reduce(0) do |sum, round|
            sum + round.investment
        end
    end

    def investors
        funding_rounds.collect do |round|
            round.venture_capitalist
        end.uniq
    end

    def big_investors
        investors.select do |investor|
            investor.total_worth > 1000000000.00    
        end
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        all.find do |startup|
            startup.founder == founder
        end
    end

    def self.domains
        all.collect do |startup|
            startup.domain                    
        end
    end
end
