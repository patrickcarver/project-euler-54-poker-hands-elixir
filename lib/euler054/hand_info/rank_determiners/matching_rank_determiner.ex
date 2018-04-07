defmodule Euler054.HandInfo.RankDeterminers.MatchingRankDeterminer do
  alias Euler054.HandInfo.Ranks

  def determine(values) do
    values
    |> Enum.chunk_by(& &1)
    |> Enum.sort(&(length(&1) >= length(&2)))
    |> List.flatten()
    |> List.to_tuple()
    |> determine_rank
  end

  defp determine_rank({first, second, third, fourth, fifth})
       when first == second and second != third and third != fourth do
    %{
      rank: Ranks.one_pair(),
      value: first,
      remainders: [third, fourth, fifth] 
    }
  end

  defp determine_rank({first, second, third, fourth, fifth})
       when first == second and second != third and third == fourth do
    %{
      rank: Ranks.two_pair(),
      values: [first, third],
      remainders: fifth
    }
  end

  defp determine_rank({first, second, third, fourth, fifth})
       when first == second and second == third and third != fourth and fourth != fifth do
    %{
      rank: Ranks.three_of_a_kind(),
      value: first,
      remainders: [fourth, fifth]
    }
  end

  defp determine_rank({first, second, third, fourth, fifth})
       when first == second and second == third and third != fourth and fourth == fifth do
    %{
      rank: Ranks.full_house(),
      values: [first, fourth]
    }
  end

  defp determine_rank({first, second, third, fourth, fifth})
       when first == second and second == third and third == fourth do
    %{
      rank: Ranks.four_of_a_kind(),
      value: first
    }
  end

  defp determine_rank(_) do
    %{ rank: Ranks.not_determined() }
  end
end
