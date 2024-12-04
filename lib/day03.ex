defmodule Day03 do
  def part_one(memory) do
    regex = ~r/mul\((\d\d?\d?),(\d\d?\d?)\)/

    Regex.scan(regex, memory)
    |> Enum.map(fn [_, first, second] ->
      String.to_integer(first) * String.to_integer(second)
    end)
    |> Enum.sum()
  end

  def part_two(memory) do
    part_one(memory) - disabled_multiples(memory)
  end

  defp disabled_multiples(memory) do
    regex = ~r/don't\(\)(.*?)(?:do\(\)|$)/

    Regex.scan(regex, memory)
    |> Enum.map(fn [_, disabled_memory] -> part_one(disabled_memory) end)
    |> Enum.sum()
  end
end

input =
  File.read!("inputs/day03.txt")
  |> String.replace("\n", "")

IO.puts("Part one: #{Day03.part_one(input)}")
IO.puts("Part two: #{Day03.part_two(input)}")
