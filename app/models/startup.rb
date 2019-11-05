class Startup
    attr_reader :domain, :founder, :investment, :venture_capitalist, :total_worth
    attr_accessor :name

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot=(domain)
        @domain
        @name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        self.all.find do |genius|
        genius.founder == founder
        end
    end

    def self.domains
        domains = self.all.map do |array|
        array.domain
        end.uniq
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment.to_f)
    end

    def select_funding_by_startup
        FundingRound.all.select do |num|
        num.startup == self
        end
    end

    def num_funding_rounds
        select_funding_by_startup.length
    end

    def total_funds
        number = select_funding_by_startup.map do |num|
        num.investment
        end
        number.inject(0) do |num, i| 
        num + i
        end
    end

    def investors
        select_funding_by_startup.map do |num|
        num.venture_capitalist
        end.uniq
    end

    def big_investors
       investor_by_company = investors.select do |investor|
            investor.total_worth > 1000000000
       end
    end
end
