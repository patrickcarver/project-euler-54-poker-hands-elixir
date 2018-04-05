defmodule Euler054.Hand do

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
      hand = cards
             |> get_init_map
             |> check_if_straight
             |> check_if_flush
             |> check_if_straight_flush
             |> check_if_royal_flush

      hand.value
    end

    defp get_init_map(cards) do
      %{
        value: nil, 
        card_values: get_card_values(cards), 
        suit_values: get_suit_values(cards),
        is_straight: nil,
        is_flush: nil  
      }      
    end

    defp check_if_straight(data) do
      is_a_straight = is_straight(data.card_values)
      value = get_value_if_straight(data.value, is_a_straight)

      %{ data | is_straight: is_a_straight, value: value }          
    end

    defp check_if_flush(data) do
      is_a_flush = is_flush(data.suit_values)
      value = get_value_if_flush(data.value, is_a_flush)

      %{ data | is_flush: is_a_flush, value: value }  
    end

    defp check_if_straight_flush(data = %{is_straight: true, is_flush: true}) do
      %{ 
        value: 9, 
        is_straight_flush: true, 
        card_values: data.card_values,
        suit_values: data.suit_values 
      }
    end

    defp check_if_straight_flush(data = %{is_straight: _, is_flush: _}) do
      %{
        value: data.value,
        is_straight_flush: false,
        card_values: data.card_values,
        suit_values: data.suit_values
      }  
    end

    defp check_if_royal_flush(data = %{is_straight_flush: true}) do
      is_a_royal_flush = is_straight_for_royal_flush(data.card_values)
      value = get_value_if_royal_flush(data.value, is_a_royal_flush)

      %{ 
        value: value, 
        card_values: data.card_values,
        suit_values: data.suit_values, 
      }        
    end

    defp check_if_royal_flush(data = %{is_straight_flush: false}) do
      %{
        value: data.value,
        card_values: data.card_values,
        suit_values: data.suit_values
      }
    end

    defp get_value_if_straight(hand_value, :false) do
      hand_value 
    end

    defp get_value_if_straight(_, :true) do
      5   
    end

    defp get_value_if_flush(hand_value, :false) do
      hand_value
    end

    defp get_value_if_flush(_, :true) do
      6
    end    

    defp get_value_if_royal_flush(hand_value, :false) do
      hand_value
    end

    defp get_value_if_royal_flush(_, :true) do
      10
    end

    defp is_straight(values) do
        ranged_list = List.first(values)..List.last(values) 
                      |> Enum.to_list
        
        values == ranged_list
    end

    defp is_flush(suits) do
        length(suits) == 1
    end

    defp is_straight_for_royal_flush(card_values) do
      card_values == Enum.to_list(10..14)
    end

    defp get_suit_values(cards) do
        Enum.map(cards, &(&1.suit)) 
        |> Enum.uniq
    end

    defp get_card_values(cards) do
        Enum.map(cards, &(&1.value)) 
        |> Enum.sort
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