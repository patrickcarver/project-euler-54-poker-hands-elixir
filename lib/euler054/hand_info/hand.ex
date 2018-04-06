defmodule Euler054.HandInfo.Hand do
  alias Euler054.HandInfo.DataCleaner

  def create(list) do
    list 
    |> DataCleaner.create_values_and_suits()
    |> determine_if_matching
  end

  defp determine_if_matching(hand) do
    hand.values
    |> chunk_and_sort
    |> List.flatten
    |> List.to_tuple
    |> determine_rank
  end

  def determine_rank({ first, second, third, fourth, _ }) when (first == second) and (third != fourth) do
    :one_pair
  end

  def determine_rank({ first, second, third, fourth, _ }) when (first == second) and (third == fourth) do
    :two_pair
  end

  def determine_rank({ first, second, third, fourth, fifth }) when first == second == third and (fourth != fifth) do
    :three_of_a_kind
  end  

  def determine_rank({ first, second, third, fourth, fifth }) when first == second == third and (fourth == fifth) do
    :full_house
  end   

  def determine_rank({ first, second, third, fourth, _ }) when first == second == third == fourth do
    :four_of_a_kind
  end

  def determine_rank(_) do
    :not_determined
  end    

  defp chunk_and_sort(values) do
    values
    |> Enum.chunk_by(&(&1))
    |> Enum.sort(&(length(&1) >= length(&2)))
  end
end

# 1  High Card: Highest value card.
# 2  One Pair: Two cards of the same value.
# 3  Two Pairs: Two different pairs.
# 4  Three of a Kind: Three cards of the same value.
# 5  Straight: All cards are consecutive values.
# 6  Flush: All cards of the same suit.
# 7  Full House: Three of a kind and a pair.
# 8  Four of a Kind: Four cards of the same value.
# 9  Straight Flush: All cards are consecutive values of same suit.
# 10 Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.

# straight, flush, straight flush, royal flush


# one pair, two pairs, three of a kind, full house, four of a kind