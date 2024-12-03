defmodule Day02 do
  @moduledoc """
  Solutions for Day02 of Advent of Code 2024.
  """

  def safe?(report) do
    deltas = deltas(report)
    Enum.all?(deltas, &(&1 in [1, 2, 3])) || Enum.all?(deltas, &(&1 in [-1, -2, -3]))
  end

  def almost_safe?(report) do
    safe?(report) ||
      Enum.any?(0..(length(report) - 1), fn skipped_index ->
        safe?(List.delete_at(report, skipped_index))
      end)
  end

  def deltas(report) do
    List.zip([
      Enum.slice(report, 0..(length(report) - 1)),
      Enum.slice(report, 1..length(report))
    ])
    |> Enum.map(fn {first, second} -> first - second end)
  end

  def part_one(reports) do
    Enum.filter(reports, &safe?(&1))
    |> Enum.count()
  end

  def part_two(reports) do
    Enum.filter(reports, &almost_safe?(&1))
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
IO.puts("Part two: #{Day02.part_two(input)}")
