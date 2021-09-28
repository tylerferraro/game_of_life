module GameOfLife
  class Cell
    AGES = [:dead, :newborn, :adult, :senior]

    attr_reader :age

    def initialize(age = 0)
      @age = age
    end

    def mutate(neighbors)
      # get alive neighbors
      # compare against game logic

      # return new mutated cell
      Cell.new(age)
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
