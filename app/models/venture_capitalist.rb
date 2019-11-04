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
        FundingRound.all.select do |round|
            round.venture_capitalist == self
        end
    end

    def portfolio
        funding_rounds.collect do |round|
            round.startup
        end.uniq
    end

    def biggest_investment
        funding_rounds.max_by do |round|
            round.investment
        end
    end

    def invested(domain)
        domain_rounds = funding_rounds.select do |round|
            round.startup.domain == domain
        end
        domain_rounds.reduce(0) do |sum, round|
            sum + round.investment
        end
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        all.select do |vc|
            vc.total_worth > 1000000000.00
        end
    end
end
