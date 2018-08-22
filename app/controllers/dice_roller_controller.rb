class DiceRollerController < ApplicationController
  def roll
    render json: {value: 5}, status: 200
  end
end
