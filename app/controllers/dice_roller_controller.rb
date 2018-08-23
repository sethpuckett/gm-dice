# frozen_string_literal: true

class DiceRollerController < ApplicationController
  def roll
    response = DiceRollerService.roll(roll_params)
    render json: response, status: 200
  end

  private

  def roll_params
    p = params.permit(:count, :sides, :constant, :attempts).to_h.symbolize_keys
    p[:count] = p[:count].to_i if p[:count]
    p[:sides] = p[:sides].to_i if p[:sides]
    p[:constant] = p[:constant].to_i if p[:constant]
    p[:attempts] = p[:attempts].to_i if p[:attempts]
    p
  end

  def count
    params[:count]
  end

  def sides
    params[:sides]
  end

  def constant
    params[:constant]
  end

  def attempts
    params[:attempts]
  end
end
