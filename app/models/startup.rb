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

  def self.all
    @@all
  end

  def pivot(domain, name)
    @domain = domain
    @name =  name
  end

  def self.find_by_founder(name)
    self.all.find do |startup|
      startup.founder == name
    end
  end

  def self.domains
    domains = self.all.map do |startup|
      startup.domain
    end.uniq
  end

  ###

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end

  def funding_rounds
    FundingRound.all.select do |round|
      round.startup == self
    end
  end

  def num_funding_rounds
    funding_rounds.length
  end

  def total_funds
    funding_rounds.reduce(0.0) do |sum, i|
      sum + i.investment
    end
  end

  def investors
    funding_rounds.map do |round|
      round.venture_capitalist
    end.uniq
  end

  def big_investors
    investors.select do |investor|
      investor.total_worth > 1     # in billions
    end
  end



end
