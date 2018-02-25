defmodule Euler054.Card do
    alias __MODULE__

    defstruct(value: nil, suit: nil)

    def create_from_text(text) do
        text
        |> String.codepoints
        |> List.to_tuple
        |> create_struct
    end

    defp create_struct({value, suit}) do
        %Card{value: String.to_integer(value), suit: suit}
    end
end