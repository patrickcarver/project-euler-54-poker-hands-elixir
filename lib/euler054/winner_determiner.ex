defmodule Euler054.WinnerDeterminer do

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

  defp determine_winner(rank, hand1, hand2) when rank in [1, 6] do
     get_high_card_winner(hand1.values, hand2.values) 
  end

  defp determine_winner(2, hand1, hand2) do
    get_one_pair_winner(hand1, hand2)
  end

  defp determine_winner(3, hand1, hand2) do
    get_two_pair_winner(hand1, hand2)
  end

  defp determine_winner(rank, hand1, hand2) when rank in [4, 7, 8] do
    get_three_of_a_kind_winner(hand1.value, hand2.value)
  end

  defp determine_winner(rank, hand1, hand2) when rank in [5, 9] do
    get_straight_winner(hand1, hand2)
  end

  defp determine_winner(10, _, _) do
      :tie
  end

  defp get_winner(value1, value2, tie_result) do
    cond do
      value1 > value2 -> :player1
      value1 < value2 -> :player2
      value1 == value2 -> tie_result
    end       
  end


  defp get_straight_winner(hand1, hand2) do
    card1 = List.first(hand1.values)
    card2 = List.first(hand2.values)

    get_winner(card1, card2, :tie)   
  end

  defp get_three_of_a_kind_winner(value1, value2) do
    get_winner(value1, value2, :tie)
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
    tie_result = get_high_card_winner(hand1.remainders, hand2.remainders)

    get_winner(hand1.value, hand2.value, tie_result)
  end

  defp get_high_card_winner(value1, value2) when length(value1) > 0 do
     [player1_card | player1_tail] = value1
     [player2_card | player2_tail] = value2

     tie_result = get_high_card_winner(player1_tail, player2_tail)

     get_winner(player1_card, player2_card, tie_result)
  end

  defp get_high_card_winner(value1, value2) when length(value1) == 0 and length(value2) == 0 do
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