defmodule Euler054.PokerParser do
    def start(text_file) do
        player1_wins_total = 0

        text_file
        |> clean_data
        |> get_number_of_player1_wins(player1_wins_total)
    end

    defp get_number_of_player1_wins(list, player1_wins_total) do
        
    end

    defp clean_data(text_file) do
        "../../assets/" <> text_file
        |> Path.expand(__DIR__)
        |> File.read!
        |> String.split(~r/\n/)
        |> Enum.map(&(String.split(&1, " ")))
    end
end