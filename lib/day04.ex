defmodule Day04 do
  def part_one(word_search) do
    word_searches = [
      word_search,
      transpose(word_search),
      downward_diagonal(word_search),
      upward_diagonal(word_search)
    ]

    for word_search <- word_searches, regex <- [~r/XMAS/, ~r/SAMX/] do
      match_count(word_search, regex)
    end
    |> Enum.sum()
  end

  defp transpose(word_search) do
    for i <- 0..((List.first(word_search) |> String.length()) - 1) do
      Enum.map(word_search, fn line -> String.at(line, i) end)
      |> Enum.join()
    end
  end

  defp upward_diagonal(word_search) do
    side_length = List.first(word_search) |> String.length()

    for i <- (1 - side_length)..(side_length - 1) do
      for j <- 0..(side_length - 1), i + j >= 0 do
        Enum.at(word_search, side_length - 1 - j) |> String.at(i + j)
      end
      |> Enum.join()
    end
  end

  defp downward_diagonal(word_search) do
    side_length = List.first(word_search) |> String.length()

    for i <- (side_length - 1)..(1 - side_length) do
      for j <- 0..(side_length - 1 - i), i + j >= 0, j < side_length do
        Enum.at(word_search, j) |> String.at(i + j)
      end
      |> Enum.join()
    end
  end

  defp match_count(word_search, regex) do
    word_search
    |> Enum.map(fn line -> Regex.scan(regex, line) |> Enum.count() end)
    |> Enum.sum()
  end

  # Fine, I'll ditch the regexes :( 
  def part_two(word_search) do
    side_length = List.first(word_search) |> String.length()

    for i <- 1..(side_length - 2), j <- 1..(side_length - 2) do
      x_mas_here?(word_search, [i, j])
    end
    |> Enum.count(& &1)
  end

  defp x_mas_here?(word_search, loc) do
    [i, j] = loc

    if at(word_search, loc, "A") do
      check_locs = [[i - 1, j - 1], [i - 1, j + 1], [i + 1, j + 1], [i + 1, j - 1]]

      for rotation <- 0..3 do
        [
          at(word_search, Enum.at(check_locs, rem(0 + rotation, 4)), "M"),
          at(word_search, Enum.at(check_locs, rem(1 + rotation, 4)), "M"),
          at(word_search, Enum.at(check_locs, rem(2 + rotation, 4)), "S"),
          at(word_search, Enum.at(check_locs, rem(3 + rotation, 4)), "S")
        ]
        |> Enum.all?()
      end
      |> Enum.any?()
    end
  end

  defp at(word_search, loc, target) do
    [i, j] = loc
    word_search |> Enum.at(i) |> String.at(j) == target
  end
end

input =
  File.read!("inputs/day04.txt")
  |> String.split("\n")
  |> Enum.reject(&(&1 == ""))

IO.puts("Part one: #{Day04.part_one(input)}")
IO.puts("Part two: #{Day04.part_two(input)}")
