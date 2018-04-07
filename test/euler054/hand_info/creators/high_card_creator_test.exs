defmodule Euler054.HandInfo.Creators.HighCardCreatorTest do
  use ExUnit.Case
  alias Euler054.HandInfo.Creators.HighCardCreator
  alias Euler054.HandInfo.Ranks

  test "hand is a high card" do
      values = [14, 9, 5, 3, 2]
      hand = HighCardCreator.create(values, %{rank: 0}, %{rank: 0})
      assert hand == %{rank: 1, values: values}
  end
end