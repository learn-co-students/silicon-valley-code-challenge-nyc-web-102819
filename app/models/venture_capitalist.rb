require 'pry'

class VentureCapitalist
    attr_reader :name, :total_worth

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
        rich_funding_rounds = FundingRound.all.select do |funding_round|
            funding_round.venture_capitalist.total_worth > 1000000000
        end
        rich_funding_rounds.map do |rich_funding_round|
            rich_funding_round.venture_capitalist
        end
    end
end
