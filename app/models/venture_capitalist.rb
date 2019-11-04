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
    self.all.select do |capitalist|
      capitalist.total_worth > 1    # in billions
    end
  end

  ###

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select do |round|
      round.venture_capitalist == self
    end
  end

  def portfolio
    funding_rounds.map do |round|
      round.startup
    end.uniq
  end

  def biggest_investment
    funding_rounds.max_by do |round|
      round.investment
    end
  end

  def invested(domain)
    dom_rounds = funding_rounds.select do |round|
      round.startup.domain == domain
    end
    dom_rounds.reduce(0.0) do |sum, i|
      sum + i.investment
    end

  end


end
