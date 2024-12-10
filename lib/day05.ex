defmodule Day05 do
  def part_one(rules, updates) do
    rule_map = parse_rule_map(rules)

    updates
    |> Enum.filter(&is_valid?(rule_map, &1, MapSet.new()))
    |> Enum.map(&middle_page(&1))
    |> Enum.sum()
  end

  defp parse_rule_map(rules) do
    Enum.reduce(rules, %{}, fn rule, rule_map ->
      [page_before, page_after] = rule

      Map.put(
        rule_map,
        page_before,
        Map.get(rule_map, page_before, MapSet.new()) |> MapSet.put(page_after)
      )
    end)
  end

  defp is_valid?(rule_map, update, previously_seen) do
    case update do
      [] ->
        true

      [head | tail] ->
        previously_seen
        |> Enum.all?(&(!MapSet.member?(Map.get(rule_map, head, MapSet.new()), &1))) &&
          is_valid?(rule_map, tail, MapSet.put(previously_seen, head))
    end
  end

  defp middle_page(update) do
    Enum.at(update, div(length(update), 2))
  end
end

[raw_rules, raw_updates, _trailing_line] =
  File.read!("inputs/day05.txt")
  |> String.split("\n\n")
  |> Enum.map(fn s -> String.split(s) |> Enum.reject(&(&1 == "")) end)

rules =
  raw_rules |> Enum.map(&(String.split(&1, "|") |> Enum.map(fn s -> String.to_integer(s) end)))

updates =
  raw_updates |> Enum.map(&(String.split(&1, ",") |> Enum.map(fn s -> String.to_integer(s) end)))

IO.puts("Part one: #{Day05.part_one(rules, updates)}")
