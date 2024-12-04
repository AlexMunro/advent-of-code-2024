defmodule Day03Test do
  use ExUnit.Case
  doctest Day03

  test "part_one sums the results of mul instructions" do
    assert Day03.part_one(
             "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
           ) == 161
  end

  test "part_two sums the results of enabled mul instructions" do
    assert Day03.part_two(
             "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"
           ) == 48
  end
end
