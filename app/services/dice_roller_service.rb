# frozen_string_literal: true

class DiceRollerService
  class << self
    def roll(
      count: Settings.defaults.count,
      sides: Settings.defaults.sides,
      constant: Settings.defaults.constant,
      attempts: Settings.defaults.attempts
    )
      raise ArgumentError, 'Invalid Roll Input' unless input_valid?(count, sides, constant, attempts)

      rolls = []

      attempts.times do
        rolls << calculate_attempt(count, sides, constant)
      end

      return rolls.first if rolls.length == 1

      rolls
    end

    private

    def input_valid?(count, sides, constant, attempts)
      count.between?(Settings.validation.min_count, Settings.validation.max_count) &&
        constant.between?(Settings.validation.min_constant, Settings.validation.max_constant) &&
        attempts.between?(Settings.validation.min_attempts, Settings.validation.max_attempts) &&
        Settings.validation.dice_sides.include?(sides)
    end

    def calculate_attempt(count, sides, constant)
      single_rolls = []
      count.times do
        single_rolls << rand(1..sides)
      end
      Roll.new(values: single_rolls, constant: constant)
    end
  end
end
