defmodule Euler054.HandInfo.Creators.HighCardCreator do
  alias Euler054.HandInfo.Ranks

  def create(values, %{rank: 0}, %{rank: 0}) do
    %{
      rank: Ranks.high_card,
      values: values
    }
  end

  def create(_, %{rank: 0}, straight_or_flush_hand) do
    straight_or_flush_hand    
  end

  def create(_, matching_hand, %{rank: 0}) do
    matching_hand
  end   
end