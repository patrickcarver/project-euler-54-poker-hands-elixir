defmodule Euler054.HandInfo.Creators.StraightOrFlushCreator do
  def create(hand_data) do
      hand_data.values
      hand_data.suits
  end
end