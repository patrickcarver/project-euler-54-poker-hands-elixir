defmodule Euler054.PokerParser do
  alias Euler054.{Round}

  def start(text_file) do
    wins = %{player1: 0, player2: 0}

    text_file
    |> clean_data
    |> get_player_wins(wins)
  end

  defp get_player_wins(list, wins) when length(list) > 0 do
    [text_for_round | tail] = list
    player = Round.process(text_for_round)
    updated_wins = Map.put(wins, player, wins[player] + 1)
    get_player_wins(tail, updated_wins)
  end

  defp get_player_wins(list, wins) when length(list) == 0 do
    wins
  end

  defp clean_data(text_file) do
    ("../../assets/" <> text_file)
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.split(~r/\n/)
    |> Enum.map(&String.split(&1, " "))
  end
end
