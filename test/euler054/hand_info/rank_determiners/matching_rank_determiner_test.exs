defmodule Euler054.HandInfo.RankDeterminers.MatchingRankDeterminerTest do
  use ExUnit.Case
  alias Euler054.HandInfo.RankDeterminers.MatchingRankDeterminer

  test "hand has one and only one pair" do
      rank = MatchingRankDeterminer.determine([5, 5, 3, 4, 2])
      assert rank == :one_pair
  end
end