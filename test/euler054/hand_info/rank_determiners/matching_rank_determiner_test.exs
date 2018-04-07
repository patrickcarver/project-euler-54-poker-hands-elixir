defmodule Euler054.HandInfo.RankDeterminers.MatchingRankDeterminerTest do
  use ExUnit.Case
  alias Euler054.HandInfo.RankDeterminers.MatchingRankDeterminer

  test "hand rank is one pair" do
    rank = MatchingRankDeterminer.determine([5, 5, 3, 4, 2])
    assert rank == :one_pair
  end

  test "hand rank is two pair" do
    rank = MatchingRankDeterminer.determine([5, 5, 4, 4, 2])
    assert rank == :two_pair
  end

  test "hand rank is three of a kind" do
    rank = MatchingRankDeterminer.determine([7, 7, 7, 3, 2])
    assert rank == :three_of_a_kind
  end

  test "hand rank is four of a kind" do
    rank = MatchingRankDeterminer.determine([7, 7, 7, 7, 2])
    assert rank == :four_of_a_kind
  end

  test "hank rank is a full house" do
    rank = MatchingRankDeterminer.determine([7, 7, 7, 2, 2])
    assert rank == :full_house
  end
end
