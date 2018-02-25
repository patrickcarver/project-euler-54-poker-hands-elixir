defmodule Euler054.Round do
    alias __MODULE__
    alias Euler054.Card

    def create_from_text(text) do
        {player1, player2} = Enum.split(text, 5)

       # player1 = create_hand(Enum.slice(text, 0, 5))
       # player2 = create_hand(Enum.slice(text, 5, 5))

        player1
    end

    defp create_hand(list) do
        Enum.map(list, &Card.create_from_text/1)
    end
end