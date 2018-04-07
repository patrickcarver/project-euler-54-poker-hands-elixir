defmodule Euler054.HandInfo.Creators.StraightOrFlushCreatorTest do
  use ExUnit.Case
  alias Euler054.HandInfo.Creators.StraightOrFlushCreator
  alias Euler054.HandInfo.Ranks

  test "hand is a straight" do
    hand_data = %{values: [10, 9, 8, 7, 6], suits: ["H", "D", "S", "D", "D"]}
    hand = StraightOrFlushCreator.create(hand_data)
    assert hand == %{ rank: Ranks.straight(), values: [10, 9, 8, 7, 6] }
  end

  test "hand is a flush" do
    hand_data = %{values: [12, 6, 4, 3, 2], suits: ["D", "D", "D", "D", "D"]}
    hand = StraightOrFlushCreator.create(hand_data)
    assert hand == %{ rank: Ranks.flush(), values: [12, 6, 4, 3, 2] }
  end

  test "hand is a straight flush" do
    hand_data = %{values: [10, 9, 8, 7, 6], suits: ["D", "D", "D", "D", "D"]}
    hand = StraightOrFlushCreator.create(hand_data)
    assert hand == %{ rank: Ranks.straight_flush(), values: [10, 9, 8, 7, 6] }
  end

  test "hand is a royal flush" do
    hand_data = %{values: [14, 13, 12, 11, 10], suits: ["D", "D", "D", "D", "D"]}
    hand = StraightOrFlushCreator.create(hand_data)
    assert hand == %{ rank: Ranks.royal_flush(), values: [14, 13, 12, 11, 10] }
  end
end