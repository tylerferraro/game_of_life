module GameOfLife
  class Game
    attr_reader :board

    def initialize(data)
      @board = Board.new(data)
    end

    def tick
      board.mutate!
    end

    def to_s
    end
  end
end
