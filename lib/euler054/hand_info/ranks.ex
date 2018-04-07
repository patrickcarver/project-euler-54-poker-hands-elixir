defmodule Euler054.Ranks do
  def not_determined() do
    0
  end

  def high_card() do
    1
  end

  def one_pair() do
    2
  end

  def two_pair() do
    3
  end

  def three_of_a_kind() do
    4
  end

  def straight() do
    5
  end

  def flush() do
    6
  end

  def full_house() do
    7
  end

  def four_of_a_kind() do
    8
  end

  def straight_flush() do
    9
  end

  def royal_flush() do
    10
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
