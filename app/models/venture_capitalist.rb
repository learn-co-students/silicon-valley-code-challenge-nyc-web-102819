class VentureCapitalist

    attr_reader :startup, :investment, :type, :domain
    attr_accessor :vc_name, :total_worth

    @@all = []

    def initialize(vc_name, total_worth)
        @vc_name = vc_name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def net_worth
        net_amount = VentureCapitalist.all.select do |vc|
        vc.vc_name == vc_name
        end
        net_amount.map do |vc|
        vc.total_worth
        end
    end

    def self.tres_commas_club
        self.all.select do |vc|
        vc.total_worth > 1000000000
        end
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select do |vc|
        vc.venture_capitalist == self
        end
    end

    def portfolio
        funding_rounds.map do |vc|
        vc.startup
        end.uniq
    end

    def biggest_investment
        funding_rounds.max_by do |num|
        num.investment
        end
    end

    def invested(domain)
        funding_rounds.reduce(0) do |sum, num|
        if num.startup.domain == domain
            sum + num.investment
        else
            sum
        end
        end
    end

end