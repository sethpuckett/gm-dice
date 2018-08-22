# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DiceRollerService do
  describe '#roll' do
    context 'with invalid input' do
      it 'raises error with invalid sides' do
        expect { DiceRollerService.roll(sides: -1) }.to raise_error(ArgumentError)
        expect { DiceRollerService.roll(sides: 3) }.to raise_error(ArgumentError)
      end

      it 'raises error with invalid constant' do
        expect { DiceRollerService.roll(constant: -1_000_001) }.to raise_error(ArgumentError)
        expect { DiceRollerService.roll(constant: 1_000_001) }.to raise_error(ArgumentError)
      end

      it 'raises error with invalid count' do
        expect { DiceRollerService.roll(count: 0) }.to raise_error(ArgumentError)
        expect { DiceRollerService.roll(count: 101) }.to raise_error(ArgumentError)
      end

      it 'raises error with invalid attempts' do
        expect { DiceRollerService.roll(attempts: 0) }.to raise_error(ArgumentError)
        expect { DiceRollerService.roll(attempts: 101) }.to raise_error(ArgumentError)
      end
    end

    context 'with valid input' do
      it 'returns singe roll with 1 attempt' do
        roll = DiceRollerService.roll
        expect(roll).to be_a(Roll)
      end

      it 'returns array of rolls with multiple attempts' do
        rolls = DiceRollerService.roll(attempts: 3)
        expect(rolls).to be_an(Array)
        expect(rolls.length).to eq(3)
        expect(rolls.first).to be_a(Roll)
      end

      it 'returns a non-zero total' do
        roll = DiceRollerService.roll
        expect(roll.total).to be > 0
      end

      it 'returns a total greater than constant' do
        roll = DiceRollerService.roll(constant: 10)
        expect(roll.total).to be > 10
      end

      it 'returns non zero total with all valid sides' do
        roll4 = DiceRollerService.roll(sides: 4)
        roll6 = DiceRollerService.roll(sides: 6)
        roll8 = DiceRollerService.roll(sides: 8)
        roll10 = DiceRollerService.roll(sides: 10)
        roll12 = DiceRollerService.roll(sides: 12)
        roll20 = DiceRollerService.roll(sides: 20)
        roll100 = DiceRollerService.roll(sides: 100)

        expect(roll4.total).to be > 0
        expect(roll6.total).to be > 0
        expect(roll8.total).to be > 0
        expect(roll10.total).to be > 0
        expect(roll12.total).to be > 0
        expect(roll20.total).to be > 0
        expect(roll100.total).to be > 0
      end
    end
  end
end
