defmodule Day01Test do
  use ExUnit.Case 
  doctest Day01 

  test "part_one sums the distances between ordered location IDs" do
    first_list = [
      3, 4, 2, 1, 3, 3
    ]

    second_list = [
      4, 3, 5, 3, 9, 3
    ]

    assert Day01.part_one(first_list, second_list) == 11
  end 
end
