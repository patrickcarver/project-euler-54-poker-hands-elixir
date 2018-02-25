defmodule Euler054.Hand do
    alias Euler054.Card

  #  @ranks: [
  #      {rank: 1, label: :high_card},
  #      {rank: 2, label: :one_pair},
  #      {rank: 3, label: :two_pair},
  #      {rank: 4, label: :three_of_a_kind},
  #      {rank: 5, label: :straight},
  #      {rank: 6, label: :flush},
  #      {rank: 7, label: :full_house},
  #      {rank: 8, label: :four_of_a_kind},
  #      {rank: 9, label: :straight_flush},
  #      {rank: 10, label: :royal_flush}
  #  ]

    def get_value(cards) do
        cards

        is_a_straight = is_straight(cards)
        is_a_flush = is_flush(cards)

    end

    defp is_straight(cards) do
        values = get_card_values(cards)
        range_to_check = values.first..values.last
        values == range_to_check
    end

    defp is_flush(cards) do
        suits = Enum.map(cards, &(&1.suit)) 
                |> Enum.uniq

        length(suits) == 1
    end

    defp get_card_values(cards) do
        Enum.map(cards, &(&1.value))
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