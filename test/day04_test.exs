defmodule Day04Test do
  use ExUnit.Case
  doctest Day04

  @word_search [
    "MMMSXXMASM",
    "MSAMXMSMSA",
    "AMXSXMAAMM",
    "MSAMASMSMX",
    "XMASAMXAMM",
    "XXAMMXXAMA",
    "SMSMSASXSS",
    "SAXAMASAAA",
    "MAMMMXMMMM",
    "MXMXAXMASX"
  ]

  test "part_one counts the XMASes to be found in the word search" do
    assert Day04.part_one(@word_search) == 18
  end

  test "part_two counts the MASes in the shape of Xs in the word search" do
    assert Day04.part_two(@word_search) == 9
  end
end
