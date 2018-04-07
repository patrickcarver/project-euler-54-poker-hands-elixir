defmodule Euler054.Round do
  alias Euler054.WinnerDeterminer
  alias Euler054.HandInfo.Hand

  def process(text) do
    {hand1_list, hand2_list} = Enum.split(text, 5)
    hand1 = Hand.create(hand1_list)
    hand2 = Hand.create(hand2_list)
    WinnerDeterminer.determine(hand1, hand2)
  end
end
