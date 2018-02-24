defmodule Euler054.PokerParser do
    def start(text_file) do
        "../../assets/" <> text_file
        |> Path.expand(__DIR__)
        |> File.read!
    end
end