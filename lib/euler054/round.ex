defmodule Euler054.Round do
    alias __MODULE__
    alias Euler054.Card

    def create_from_text(text) do
        {player1_list, player2_list} = Enum.split(text, 5)

        player1 = create_hand(player1_list)
        player2 = create_hand(player2_list)

        player1
        
    end

    defp create_hand(list) do
        Enum.map(list, &Card.create_from_text/1)
        |> Enum.sort_by(&(&1.value))
    end
end