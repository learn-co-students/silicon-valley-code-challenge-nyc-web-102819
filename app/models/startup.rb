class Startup
    attr_reader :founder
    attr_accessor :name, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder 
        @domain = domain

        @@all << self
    end

    def self.all
        @@all
    end

    def pivot(domain, name)
        @name = name
        @domain = domain
        self
    end

    def self.find_by_founder(founder)
        self.all.find do |founder|
            founder.founder
        end
    end

    def self.domains
        self.all.map do |domains|
            domains.domain
        end
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def my_funding_rounds
        FundingRound.all.select do |fr|
            fr.startup == self
        end
    end

    def num_funding_rounds
        my_funding_rounds.count
    end

    def total_funds
        funding = my_funding_rounds.map do |fr|
            fr.investment
        end
        funding.sum
    end

    def investors
        my_investors = my_funding_rounds.map do |fr|
            fr.venture_capitalist
        end
        my_investors.uniq
    end

    def big_investors
        investors.select do |inv|
            inv.total_worth >= 1000000000
        end
    end

end
