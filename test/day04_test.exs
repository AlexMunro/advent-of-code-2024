defmodule Day04Test do
  use ExUnit.Case
  doctest Day04

  test "part_one counts the XMASes to be found in the word search" do
    assert Day04.part_one([
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
           ]) == 18
  end
end
