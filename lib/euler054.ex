defmodule Euler054 do
  alias Euler054.PokerParser

  def start do
    "poker.txt"
    |> PokerParser.start()
    |> display_wins()
  end

  defp display_wins(wins) do
    IO.puts("----------------------------")
    IO.puts("Player 1: #{wins.player1}")
    IO.puts("Player 2: #{wins.player2}")
    IO.puts("----------------------------")
  end
end
