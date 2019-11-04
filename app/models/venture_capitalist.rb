class VentureCapitalist

    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        
        @@all << self
    end 

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end 

    def funding_rounds
        FundingRound.all.select { |fr| fr.venture_capitalist == self }
    end 

    def portfolio
        funding_rounds.map { |fr| fr.startup }
    end 

    def biggest_investment
        investment_amounts = funding_rounds.map { |fr| fr.investment }
        largest_investment = investment_amounts.max 

        funding_rounds.find { |fr| fr.investment == largest_investment }
    end 

    # def invested(domain)  THIS WORKS
    #     rounds = FundingRound.all.select do |round|
    #         round.venture_capitalist == self && round.startup.domain == domain 
    #     end
    #     rounds.reduce(0) do |sum, item|
    #         sum + item.investment
    #     end

    def invested(domain)
        funding_rounds_within_domain = funding_rounds.select { |fr| fr.startup.domain == domain }
        investments_within_domain = funding_rounds_within_domain.map { |fr| fr.investment }
        investments_within_domain.sum
    end

    def self.all
        @@all
    end 

    def self.tres_commas_club
        self.all.select { |vc| vc.total_worth > 1000000000 }
    end 

end
