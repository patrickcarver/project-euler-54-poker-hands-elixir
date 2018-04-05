defmodule Euler054.Hand do
  def create(list) do
    temp = Enum.map(list, &String.codepoints/1)
    values = Enum.map(temp, &List.first/1)
    suits = Enum.map(temp, &List.last/1)
    {values, suits}
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


# values, suits
# 