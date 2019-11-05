class VentureCapitalist
    attr_reader :name
    attr_accessor :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth

        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select do |worth| 
        worth.total_worth >= 1000000000
        end
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select do |fr|
            fr.venture_capitalist == self 
        end
    end

    def portfolio
        startups = funding_rounds.map do |fr|
            fr.startup
        end
        startups.uniq
    end

    def biggest_investment
        funding_rounds.max do |fr|
            fr.investment
        end
    end

    def invested(domain) #given a domain string, returns the total amount invested in that domain
        domain_startups = funding_rounds.select do |fr| #iterates through funding_rounds array 
            fr.startup.domain == domain #returns a new funding round array with only startup domains matching argument domain
        end 
        investments = domain_startups.map {|fr| fr.investment} #iterate through domain_startups and create an array of just investment amounts
        investments.sum #adds all investment amounts together
    end



end
