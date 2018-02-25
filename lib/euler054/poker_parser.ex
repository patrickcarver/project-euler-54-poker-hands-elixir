defmodule Euler054.PokerParser do
    alias Euler054.{Round}

    def start(text_file) do
        player1_wins_total = 0

        text_file
        |> clean_data
        |> get_number_of_player1_wins(player1_wins_total)
    end

    defp get_number_of_player1_wins(list, player1_wins_total) do
        Enum.map(list, &Round.create_from_text/1)
    end

    defp clean_data(text_file) do
        "../../assets/" <> text_file
        |> Path.expand(__DIR__)
        |> File.read!
        |> String.split(~r/\n/)
        |> Enum.map(&(String.split(&1, " ")))
    end
end