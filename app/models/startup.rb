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

    def pivot(domain, name)
        self.domain = domain
        self.name = name
        
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        FundingRound.all.find {|funding_round| funding_round.startup.founder == founder}.startup
    end

    def self.domains
        FundingRound.all.map {|funding_round| funding_round.startup.domain} 
    end

    def sign_contract(venturecapitalist, type, amount)
        amount = amount.to_f
        FundingRound.new(self, venturecapitalist, type, amount)
    end

    def find_my_fundingrounds
        FundingRound.all.select do |fundinground|
            fundinground.startup == self
        end
    end

    def num_funding_round
        self.find_my_fundingrounds.length
    end

    def total_funds
        self.find_my_fundingrounds.map do |my_funding_round|
            my_funding_round.investment
        end.inject(0) {|sum, num| sum + num}
        
    end

    def investors
        self.find_my_fundingrounds.map do |funding_round|
            funding_round.venture_capitalist
        end.uniq
    end

    def big_investors
        self.find_my_fundingrounds.select do |funding_round|
            funding_round.venture_capitalist.total_worth > 1000000000
        end.map {|funding_round| funding_round.venture_capitalist}
    end

    private
    attr_writer :domain

end
