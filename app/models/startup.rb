class Startup
    attr_reader :name, :founder, :domain
    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end
###########
    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(f_name)
        @@all.find do |startup|
            startup.founder == f_name
        end
    end

    def self.domains
        @@all.map do |startup|
            startup.domain
        end
    end
#############
    def sign_contract(vc, type, investment)
        FundingRound.new(self, vc, type, investment)
    end

    def all_fundings                                #helper method
        FundingRound.all.select do |fr|
            fr.startup == self
        end
    end

    def num_funding_rounds
        all_fundings.count
    end

    def total_funds
        total = 0
        all_fundings.each do |fr|
            total += fr.investment
        end
        total
    end

    def investors
        all_fundings.map do |fr|
            fr.venture_capitalist
        end
    end

    def big_investors
        investors.select do |vc|
            vc.total_worth > 1000000000
        end
    end
end
