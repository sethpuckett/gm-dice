# frozen_string_literal: true

class DiceRollerService
  class << self
    def roll(count: 1, sides: 6, constant: 0, attempts: 1)
      raise ArgumentError, 'Invalid Roll Input' unless input_valid?(count, sides, constant, attempts)
    end

    private

    def input_valid?(count, sides, constant, attempts)
      count.between?(1, 100) &&
        constant.between?(-1_000_000, 1_000_000) &&
        attempts.between?(1, 100) &&
        valid_sides.include?(sides)
    end

    def valid_sides
      [4, 6, 8, 10, 12, 20, 100]
    end
  end
end
