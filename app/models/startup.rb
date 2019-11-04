class Startup

    attr_accessor :name, :domain
    attr_reader :founder

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain

        @@all << self 
    end 

    def pivot(name, domain)
        self.name = name 
        self.domain = domain
    end 

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end 

    def funding_rounds 
        FundingRound.all.select { |fr| fr.startup == self }
    end 

    def num_funding_rounds
        funding_rounds.count
    end 

    def total_funds
        all_funds = funding_rounds.map { |fr| fr.investment }
        all_funds.sum
    end 

    def investors
        investors_array = funding_rounds.map { |fr| fr.venture_capitalist }
        investors_array.uniq
    end 

    def big_investors
        investors.select { |vc| vc.total_worth > 1000000000 }.uniq
    end 

    def self.all
        @@all
    end 

    def self.find_by_founder(founder_name)
        self.all.find { |startup| startup.founder == founder_name}
    end 

    def self.domains
        self.all.map { |startup| startup.domain }
    end 

end
