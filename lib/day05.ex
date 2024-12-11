defmodule Day05 do
  def part_one(rules, updates) do
    rule_map = parse_rule_map(rules)

    updates
    |> Enum.filter(&is_valid?(rule_map, &1, MapSet.new()))
    |> Enum.map(&middle_page(&1))
    |> Enum.sum()
  end

  def part_two(rules, updates) do
    rule_map = parse_rule_map(rules)

    updates
    |> Enum.reject(&is_valid?(rule_map, &1, MapSet.new()))
    |> Enum.map(&(correct_update(rule_map, &1) |> middle_page()))
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

  defp correct_update(rule_map, update) do
    correcter_update = slightly_corrected_update(rule_map, update)

    if correcter_update == update do
      update
    else
      correct_update(rule_map, correcter_update)
    end
  end

  defp slightly_corrected_update(rule_map, update) do
    # Switch the earliest broken rule with the page that breaks it
    swap_indexes =
      1..(Enum.count(update) - 1)
      |> Enum.find_value([0, 0], fn rule_index ->
        if rule_requirements = Map.get(rule_map, Enum.at(update, rule_index)) do
          violating_index =
            Enum.slice(update, 0..(rule_index - 1))
            |> Enum.find_index(&MapSet.member?(rule_requirements, &1))

          if violating_index != nil do
            [rule_index, violating_index]
          else
            nil
          end
        end
      end)

    [first_index, second_index] = swap_indexes

    update
    |> List.replace_at(first_index, Enum.at(update, second_index))
    |> List.replace_at(second_index, Enum.at(update, first_index))
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
IO.puts("Part two: #{Day05.part_two(rules, updates)}")
