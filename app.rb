require 'pry'

class Building

    attr_accessor :name, :number_of_tenants
    attr_reader :address, :number_of_floors

    @@all = []

    def initialize name, address, number_of_floors, number_of_tenants
        @name = name
        @address = address
        @number_of_floors = number_of_floors
        @number_of_tenants = number_of_tenants

        @@all << self
    end 

    def self.all
        @@all
    end

    def self.average_tenants_per_floor
        total_floors = @@all.reduce(0) do |sum, building|
            sum = sum + building.number_of_floors
        end
        total_tenants = @@all.reduce(0) do |sum, building|
            sum = sum + building.number_of_tenants
        end
        total_tenants.to_f/total_floors
    end

    def self.average_tenants_per_building
        total_tenants = @@all.reduce(0) do |sum, building|
            sum = sum + building.number_of_tenants
        end
        total_tenants.to_f/@@all.length
    end

    def name_and_address
        puts "#{name} located on #{address}"
    end
end

the_hub = Building.new "The Hub", "Walnut Street", 7, 700
the_lab = Building.new "The Lab", "Platte Street", 5, 1000

binding.pry