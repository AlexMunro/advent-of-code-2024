defmodule Day03 do
  def uncorrupted_multiples(memory) do
    regex = ~r/mul\((\d+),(\d+)\)/
    matches = Regex.scan(regex, memory)

    Enum.map(matches, fn [_, first, second] ->
      String.to_integer(first) * String.to_integer(second)
    end)
    |> Enum.sum()
  end

  def part_one(input) do
    input
    |> Enum.map(&uncorrupted_multiples(&1))
    |> Enum.sum()
  end
end

input =
  File.read!("inputs/day03.txt")
  |> String.split("\n")
  |> Enum.reject(&(&1 == ""))

IO.puts("Part one: #{Day03.part_one(input)}")
