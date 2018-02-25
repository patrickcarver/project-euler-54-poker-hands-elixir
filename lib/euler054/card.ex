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
        cleaned_value = clean_value(value)

        %Card{value: cleaned_value, suit: suit}
    end

    defp clean_value("T") do
        10        
    end

    defp clean_value("J") do
        11
    end

    defp clean_value("Q") do
        12
    end

    defp clean_value("K") do
        13
    end

    defp clean_value("A") do
        14
    end

    defp clean_value(value) do
        String.to_integer(value)    
    end
end