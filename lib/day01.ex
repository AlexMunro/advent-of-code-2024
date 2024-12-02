defmodule Day01 do
  @moduledoc """
  Solutions for Day01 of Advent of Code 2024.
  """

  def part_one(first_list, second_list) do
    sorted_first_list = Enum.sort(first_list)
    sorted_second_list = Enum.sort(second_list)

    pairs = List.zip([sorted_first_list, sorted_second_list])

    distances = Enum.map(pairs, fn {first, second} -> abs(first - second) end)

    Enum.sum(distances)
  end
end

input =
  File.read!("inputs/day01.txt")
  |> String.split("\n")
  |> Enum.reject(&(&1 == ""))
  |> Enum.map(&String.split(&1))

numerical_pairs =
  Enum.map(input, fn x ->
    Enum.map(x, fn y -> String.to_integer(y) end)
  end)

first_list = Enum.map(numerical_pairs, &List.first(&1))
second_list = Enum.map(numerical_pairs, &List.last(&1))

IO.puts("Part one: #{Day01.part_one(first_list, second_list)}")
