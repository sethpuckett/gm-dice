class DiceRollerService
  def self.roll(count: 1, sides: 6, constant: 0, attempts: 1)
    return 1 if input_valid?(count,sides,constant,attempts)
    0
  end

  private

  def self.input_valid?(count, sides, constant, attempts)
    count > 0 &&
      count < 100 &&
      constant > -1000000 &&
      constant < 1000000 &&
      attempts > 0 &&
      attempts < 100 &&
      valid_sides.include?(sides)
  end

  def self.valid_sides
    [4, 6, 8, 10, 12, 20, 100]
  end
end