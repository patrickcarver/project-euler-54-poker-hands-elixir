defmodule Euler054.HandInfo.DataCleaner do
  def create_values_and_suits(list) do
    temp = Enum.map(list, &String.codepoints/1)
    values = clean_values(temp) 
    suits = clean_suits(temp)

    %{ values: values, suits: suits }      
  end

  defp clean_suits(list) do
    Enum.map(list, &List.last/1)      
  end

  defp clean_values(list) do             
    Enum.map(list, &List.first/1)
    |> Enum.map(&clean_value/1)
    |> Enum.sort(&(&1 >= &2))    
  end

  defp clean_value(value) do
    case value do
      "A" -> 14
      "K" -> 13
      "Q" -> 12
      "J" -> 11
      "T" -> 10
      _ -> String.to_integer(value)
    end
  end
end