defmodule Euler054.WinnerDeterminer do
  def determine(hand1, hand2) do
    player = get_player_with_highest_rank(hand1.rank, hand2.rank)      
  end

  defp get_player_with_highest_rank(rank1, rank2) when rank1 > rank2 do
      :player1
  end

  defp get_player_with_highest_rank(rank1, rank2) when rank1 < rank2 do
      :player2
  end

  defp get_player_with_highest_rank(rank1, rank2) when rank1 == rank2 do
      :player1
  end
end