defmodule Euler054.HandInfo.RankDeterminers.MatchingRankDeterminer do
  def determine(values) do
    values
    |> Enum.chunk_by(&(&1))
    |> Enum.sort(&(length(&1) >= length(&2)))
    |> List.flatten
    |> List.to_tuple
    |> determine_rank
  end

  defp determine_rank({ first, second, third, fourth, _ }) when (first == second) and (third != fourth) do
    :one_pair
  end

  defp determine_rank({ first, second, third, fourth, _ }) when (first == second) and (third == fourth) do
    :two_pair
  end

  defp determine_rank({ first, second, third, fourth, fifth }) when first == second == third and (fourth != fifth) do
    :three_of_a_kind
  end  

  defp determine_rank({ first, second, third, fourth, fifth }) when first == second == third and (fourth == fifth) do
    :full_house
  end   

  defp determine_rank({ first, second, third, fourth, _ }) when first == second == third == fourth do
    :four_of_a_kind
  end

  defp determine_rank(_) do
    :not_determined
  end    
end