defmodule Euler054.HandInfo.Hand do
  alias Euler054.HandInfo.DataCleaner
  alias Euler054.HandInfo.Creators.{MatchingCardCreator, StraightOrFlushCreator, HighCardCreator}

  def create(list) do
    hand_data = DataCleaner.create_values_and_suits(list)

    matching_hand = MatchingCardCreator.create(hand_data.values)
    straight_or_flush_hand = StraightOrFlushCreator.create(hand_data)
    HighCardCreator.create(hand_data.values, matching_hand, straight_or_flush_hand)    
  end
end