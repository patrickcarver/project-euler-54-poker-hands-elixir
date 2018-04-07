defmodule Euler054.HandInfo.Hand do
  alias Euler054.HandInfo.{DataCleaner, Ranks}
  alias Euler054.HandInfo.Creators.{MatchingCardCreator, StraightOrFlushCreator}

  def create(list) do
    hand_data = DataCleaner.create_values_and_suits(list)

    matching_hand = MatchingCardCreator.create(hand_data.values)
    straight_or_flush_hand = StraightOrFlushCreator.create(hand_data)
    check_if_high_card(hand_data.values, matching_hand, straight_or_flush_hand)
    
  end

  defp check_if_high_card(values, %{rank: 0}, %{rank: 0}) do
    %{
      rank: Ranks.high_card,
      values: values
    }
  end

  defp check_if_high_card(_, %{rank: 0}, straight_or_flush_hand) do
    straight_or_flush_hand    
  end

  defp check_if_high_card(_, matching_hand, %{rank: 0}) do
    matching_hand
  end   
end