defmodule Day02 do
  @moduledoc """
  Solutions for Day02 of Advent of Code 2024.
  """

  def safe?(report) do
    deltas =
      List.zip([
        Enum.slice(report, 0..(length(report) - 1)),
        Enum.slice(report, 1..length(report))
      ])
      |> Enum.map(fn {first, second} -> first - second end)

    Enum.all?(deltas, &(&1 in [1, 2, 3])) || Enum.all?(deltas, &(&1 in [-1, -2, -3]))
  end

  def part_one(reports) do
    Enum.filter(reports, &safe?(&1))
    |> Enum.count()
  end
end

input =
  File.read!("inputs/day02.txt")
  |> String.split("\n")
  |> Enum.reject(&(&1 == ""))
  |> Enum.map(fn x ->
    String.split(x) |> Enum.map(&String.to_integer(&1))
  end)

IO.puts("Part one: #{Day02.part_one(input)}")
