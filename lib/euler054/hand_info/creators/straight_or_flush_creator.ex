defmodule Euler054.HandInfo.Creators.StraightOrFlushCreator do
  alias Euler054.HandInfo.Ranks
    
  def create(hand_data) do

      rank = %{is_straight: nil, is_flush: nil, rank: 0}
             |> determine_if_straight(hand_data.values)
             |> determine_if_flush(hand_data.suits)
             |> determine_if_straight_flush(hand_data.values)
      
      %{
        rank: rank,
        values: hand_data.values
      }
  end

  defp determine_if_straight_flush(%{is_straight: true, is_flush: true}, values) do
    case values do
        [14, 13, 12, 11, 10] -> Ranks.royal_flush()
        _ -> Ranks.straight_flush()
    end
  end

  defp determine_if_straight_flush(%{is_straight: _, is_flush: _, rank: rank_num}, _) do
    rank_num
  end

  defp get_straight_comparison_list(values) do
    first = List.first(values)
    last = List.last(values)
    Enum.to_list(first..last)    
  end

  defp determine_if_straight(map, values) do
    comparison_list = get_straight_comparison_list(values)
    do_lists_match = values == comparison_list

    rank =  case do_lists_match do
              true -> Ranks.straight()
              false -> map.rank
            end

    %{is_straight: do_lists_match, is_flush: map.is_flush, rank: rank}      
  end

  defp determine_if_flush(map, suits) do
    is_only_one_suit = length(Enum.uniq(suits)) == 1
    
    rank =  case is_only_one_suit do
              true -> Ranks.flush()
              false -> map.rank
            end

    %{is_straight: map.is_straight, is_flush: is_only_one_suit, rank: rank}
  end
end

