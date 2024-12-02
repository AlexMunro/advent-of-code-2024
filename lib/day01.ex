defmodule Day01 do
  @moduledoc """
  Solutions for Day01 of Advent of Code 2024.
  """

  def part_one(left_list, right_list) do
    sorted_first_list = Enum.sort(left_list)
    sorted_right_list = Enum.sort(right_list)

    List.zip([sorted_first_list, sorted_right_list])
    |> Enum.map(fn {left, right} -> abs(left - right) end)
    |> Enum.sum()
  end

  def part_two(left_list, right_list) do
    right_list_tallies = Enum.frequencies(right_list)

    left_list
    |> Enum.map(&(&1 * (right_list_tallies[&1] || 0)))
    |> Enum.sum()
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

left_list = Enum.map(numerical_pairs, &List.first(&1))
right_list = Enum.map(numerical_pairs, &List.last(&1))

IO.puts("Part one: #{Day01.part_one(left_list, right_list)}")
IO.puts("Part two: #{Day01.part_two(left_list, right_list)}")
