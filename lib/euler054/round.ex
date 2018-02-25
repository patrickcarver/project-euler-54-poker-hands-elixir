defmodule Euler054.Round do
    alias __MODULE__
    alias Euler054.{Card, Hand}

    def create_from_text(text) do
        {hand1_list, hand2_list} = Enum.split(text, 5)

        hand1 = get_hand_value(hand1_list)
        hand2 = get_hand_value(hand2_list)
    end

    defp create_hand(list) do
        Enum.map(list, &Card.create_from_text/1)
        |> Enum.sort_by(&(&1.value))
    end

    defp get_hand_value(list) do
        list
        |> create_hand
        |> Hand.get_value
    end
end