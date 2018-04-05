defmodule Euler054.PokerParser do
    alias Euler054.{Round}

    def start(text_file) do
        wins = %{ player1: 0, player2: 0 }

        text_file
        |> clean_data
        |> get_player_wins(wins)
        |> display_wins
    end

    defp display_wins(wins) do
        IO.puts "----------------------------"
        IO.puts "Player 1: #{wins.player1}"
        IO.puts "Player 2: #{wins.player2}"
        IO.puts "----------------------------"
    end

    defp get_player_wins(list, wins) do
        #Enum.map(list, &Round.create_from_text/1)
        wins
    end

    defp clean_data(text_file) do
        "../../assets/" <> text_file
        |> Path.expand(__DIR__)
        |> File.read!
        |> String.split(~r/\n/)
        |> Enum.map(&(String.split(&1, " ")))
    end
end