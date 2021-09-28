module GameOfLife
  class Cell
    AGES = [:dead, :newborn, :adult, :senior]

    attr_reader :age

    def initialize(age)
      @age = age
    end

    def mutate(neighbors)
      # get alive neighbors
      # compare against game logic

      # return new mutated cell
      Cell.new(age)
    end
  end
end
