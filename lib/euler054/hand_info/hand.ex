defmodule Euler054.HandInfo.Hand do
  alias Euler054.HandInfo.DataCleaner
  alias Euler054.HandInfo.RankDeterminers.MatchingRankDeterminer
  alias Euler054.HandInfo.Creators.StraightOrFlushCreator

  def create(list) do
    hand_data = DataCleaner.create_values_and_suits(list)

    matching_hand = MatchingRankDeterminer.determine(hand_data.values)
    straight_or_flush_hand = StraightOrFlushCreator.create(hand_data)

    matching_hand
  end
end

# straight, flush, straight flush, royal flush

# one pair, two pairs, three of a kind, full house, four of a kind
