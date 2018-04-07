defmodule Euler054.WinnerDeterminer do
  alias Euler054.HandInfo.Ranks

  def determine(hand1, hand2) do
    player = get_player_with_highest_rank(hand1.rank, hand2.rank)

    case player do
        :player1 -> player
        :player2 -> player
        :tie -> break_tie(hand1, hand2)
    end      
  end

  defp break_tie(hand1, hand2) do
    rank = hand1.rank
    determine_winner(rank, hand1, hand2)
  end

  defp determine_winner(1, hand1, hand2) do
     get_high_card_winner(hand1.values, hand2.values) 
  end

  defp determine_winner(2, hand1, hand2) do
    get_one_pair_winner(hand1, hand2)
  end

  defp determine_winner(3, hand1, hand2) do
    get_two_pair_winner(hand1, hand2)
  end

  defp determine_winner(4, hand1, hand2) do
    get_three_of_a_kind_winner(hand1, hand2)
  end

  defp determine_winner(5, hand1, hand2) do
    get_straight_winner(hand1, hand2)
  end

  defp determine_winner(6, hand1, hand2) do
    get_high_card_winner(hand1.values, hand2.values)
  end

  defp determine_winner(7, hand1, hand2) do
    get_three_of_a_kind_winner(hand1, hand2)
  end

  defp determine_winner(8, hand1, hand2) do
    get_three_of_a_kind_winner(hand1, hand2)
  end

  defp determine_winner(9, hand1, hand2) do
    get_straight_winner(hand1, hand2)
  end

  defp determine_winner(10, hand1, hand2) do
      :tie
  end

  defp determine_winner(rank, hand1, hand2) do
      :player1
  end

  defp get_straight_winner(hand1, hand2) do
    card1 = List.first(hand1.values)
    card2 = List.first(hand2.values)

    cond do
        card1 > card2 -> :player1
        card1 < card2 -> :player2
        card1 == card2 -> :tie
    end    
  end

  defp get_three_of_a_kind_winner(hand1, hand2) do
    cond do
      hand1.value > hand2.value -> :player1
      hand1.value < hand2.value -> :player2
      hand1.value == hand2.value -> :tie
    end    
  end

  defp get_two_pair_winner(hand1, hand2) do
      player = get_high_card_winner(hand1.values, hand2.values)

      if player == :tie do
        get_high_card_winner(hand1.remainders, hand2.remainders)    
      else
        player
      end
  end

  defp get_one_pair_winner(hand1, hand2) do
      cond do
          hand1.value > hand2.value -> :player1
          hand1.value < hand2.value -> :player2
          hand1.value == hand2.value -> get_high_card_winner(hand1.remainders, hand2.remainders)
      end
  end

  defp get_high_card_winner(value1, value2) when length(value1) > 0 do
     [player1_card | player1_tail] = value1
     [player2_card | player2_tail] = value2

     cond do
         player1_card > player2_card -> :player1
         player1_card < player2_card -> :player2
         player1_card == player2_card -> get_high_card_winner(player1_tail, player2_tail)
     end
  end

  defp get_high_card_winner(value1, value2) when length(value1) == 0 do
      :tie
  end

  defp get_player_with_highest_rank(rank1, rank2) when rank1 > rank2 do
      :player1
  end

  defp get_player_with_highest_rank(rank1, rank2) when rank1 < rank2 do
      :player2
  end

  defp get_player_with_highest_rank(rank1, rank2) when rank1 == rank2 do
      :tie
  end
end