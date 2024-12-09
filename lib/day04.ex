defmodule Day04 do
  def part_one(word_search) do
    word_searches = [
      word_search,
      transpose(word_search),
      downward_diagonal(word_search),
      upward_diagonal(word_search)
    ]

    regexes = [~r/X[^XMAS]*M[^XMAS]*A[^XMAS]*S/, ~r/S[^XMAS]*A[^XMAS]*M[^XMAS]*X/]

    for word_search <- word_searches, regex <- regexes do
      match_count(word_search, regex)
    end
    |> Enum.sum()
  end

  def transpose(word_search) do
    for i <- 0..((List.first(word_search) |> String.length()) - 1) do
      Enum.map(word_search, fn line -> String.at(line, i) end)
      |> Enum.join()
    end
  end

  def upward_diagonal(word_search) do
    side_length = List.first(word_search) |> String.length()

    for i <- (1 - side_length)..(side_length - 1) do
      for j <- 0..(side_length - 1), i + j >= 0 do
        Enum.at(word_search, side_length - 1 - j) |> String.at(i + j)
      end
      |> Enum.join()
    end
  end

  def downward_diagonal(word_search) do
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
end

input =
  File.read!("inputs/day04.txt")
  |> String.split("\n")
  |> Enum.reject(&(&1 == ""))

IO.puts("Part one: #{Day04.part_one(input)}")
