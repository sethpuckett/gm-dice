# frozen_string_literal: true

class DiceRollerController < ApplicationController
  def roll
    result = DiceRollerService.roll(roll_params)
    if result.blank?
      render json: { message: 'Invalid parameters' }, status: 422
    elsif result.is_a?(Array)
      render json: RollRepresenter.for_collection.new(result).to_json, status: 200
    else
      render json: RollRepresenter.new(result).to_json, status: 200
    end
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
end
