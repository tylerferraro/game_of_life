module GameOfLife
  class Cell
    AGES = [:dead, :newborn, :adult, :senior]

    attr_reader :age

    def initialize(age = 0)
      @age = age
    end

    def mutate(neighbors = [])
      alive_neighbors = neighbors.reject(&:dead?)

      new_age = 1 if dead? && alive_neighbors.count { |neighbor| neighbor.adult? } == 2
      new_age = 2 if newborn? && (2..4).include?(alive_neighbors.count)
      new_age = 3 if adult? && (1..2).include?(alive_neighbors.count)
      new_age ||= 0

      Cell.new(new_age)
    end

    def alive?
      @age > 0
    end

    def dead?
      @age == 0
    end

    def newborn?
      @age == 1
    end

    def adult?
      @age == 2
    end

    def senior?
      @age == 3
    end
  end
end
