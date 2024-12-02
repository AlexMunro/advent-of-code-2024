defmodule Day01Test do
  use ExUnit.Case
  doctest Day01

  @left_list [3, 4, 2, 1, 3, 3]
  @right_list [4, 3, 5, 3, 9, 3]

  test "part_one sums the distances between ordered location IDs" do
    assert Day01.part_one(@left_list, @right_list) == 11
  end

  test "part_two multiplies each value in the left list by the number of times it appears in the right list and sums them" do
    assert Day01.part_two(@left_list, @right_list) == 31
  end
end
