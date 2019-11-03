class Startup
    attr_reader :founder
    attr_accessor :name, :domain

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
        @name = name
        @domain = domain
        self
    end

    def self.find_by_founder(founder)
        self.all.find do |founder|
            founder.founder
        end
    end

    def self.domains
        self.all.map do |domains|
            domains.domain
        end
    end





end
