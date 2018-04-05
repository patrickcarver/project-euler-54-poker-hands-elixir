defmodule Euler054.Round do
    alias __MODULE__
    alias Euler054.{Hand}

    def process(text) do
        {hand1_list, hand2_list} = Enum.split(text, 5)
        hand1 = Hand.create(hand1_list)
        hand2 = Hand.create(hand2_list)
        determine_winner(hand1, hand2)
    end

    defp determine_winner(hand1, hand2) do
        IO.inspect hand1
        :player1
    end
end