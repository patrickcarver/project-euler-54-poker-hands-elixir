defmodule Euler054.HandInfo.Creator.MatchingCardCreatorTest do
  use ExUnit.Case
  alias Euler054.HandInfo.Creator.MatchingCardCreator
  alias Euler054.HandInfo.Ranks

  test "hand is one pair" do
    hand = MatchingCardCreator.determine([5, 5, 3, 4, 2])
    assert hand == %{ rank: Ranks.one_pair(), value: 5, remainders: [3, 4, 2] }
  end

  test "hand is two pair" do
    hand = MatchingCardCreator.determine([5, 5, 4, 4, 2])
    assert hand == %{ rank: Ranks.two_pair(), values: [5, 4], remainders: 2 }
  end

  test "hand is three of a kind" do
    hand = MatchingCardCreator.determine([7, 7, 7, 3, 2])
    assert hand == %{ rank: Ranks.three_of_a_kind(), value: 7, remainders: [3, 2] } 
  end

  test "hand is four of a kind" do
    hand = MatchingCardCreator.determine([7, 7, 7, 7, 2])
    assert hand == %{ rank: Ranks.four_of_a_kind(), value: 7 }
  end

  test "hand is a full house" do
    hand = MatchingCardCreator.determine([7, 7, 7, 2, 2])
    assert hand == %{ rank: Ranks.full_house(), values: [7, 2] }
  end
end