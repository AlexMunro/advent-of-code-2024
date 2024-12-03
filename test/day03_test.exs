defmodule Day03Test do
  use ExUnit.Case
  doctest Day03

  @memory "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"

  test "uncorrupted_multiples sums the results of mul instructions" do
    assert Day03.uncorrupted_multiples(@memory) == 161
  end
end