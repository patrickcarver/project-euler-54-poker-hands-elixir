defmodule Euler054.HandTest do
  use ExUnit.Case
  alias Euler054.{Card, Hand}

  test "hand is a straight, values are sorted" do
    cards = [
        %Card{value: 6, suit: "H"},
        %Card{value: 7, suit: "H"},
        %Card{value: 8, suit: "C"},
        %Card{value: 9, suit: "S"},
        %Card{value: 10, suit: "D"}
    ]

    assert Hand.get_value(cards) == 5      
  end

  test "hand is a straight, values not sorted" do
    cards = [
        %Card{value: 10, suit: "H"},
        %Card{value: 7, suit: "H"},
        %Card{value: 8, suit: "C"},
        %Card{value: 9, suit: "S"},
        %Card{value: 6, suit: "D"}
    ]

    assert Hand.get_value(cards) == 5      
  end  

  test "hand is a flush" do
    cards = [
        %Card{value: 6, suit: "H"},
        %Card{value: 7, suit: "H"},
        %Card{value: 3, suit: "H"},
        %Card{value: 2, suit: "H"},
        %Card{value: 5, suit: "H"}
    ]

    assert Hand.get_value(cards) == 6
  end

  test "hand is a straight flush" do
    cards = [
        %Card{value: 6, suit: "H"},
        %Card{value: 7, suit: "H"},
        %Card{value: 8, suit: "H"},
        %Card{value: 9, suit: "H"},
        %Card{value: 5, suit: "H"}
    ]

    assert Hand.get_value(cards) == 9
  end

  test "hand is a royal flush" do
    cards = [
        %Card{value: 10, suit: "H"},
        %Card{value: 11, suit: "H"},
        %Card{value: 12, suit: "H"},
        %Card{value: 13, suit: "H"},
        %Card{value: 14, suit: "H"}
    ]

    assert Hand.get_value(cards) == 10      
  end
end