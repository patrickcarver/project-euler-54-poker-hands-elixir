defmodule Euler054.PokerParser do
    def start(text_file) do
        player1_wins = 0

        text_file
        |> clean_data
    end

    defp clean_data(text_file) do
        "../../assets/" <> text_file
        |> Path.expand(__DIR__)
        |> File.read!
        |> String.split(~r/\n/)
        |> Enum.map(&(String.split(&1, " "))) 
    end
end