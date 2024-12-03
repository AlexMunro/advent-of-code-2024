defmodule Day02Test do
  use ExUnit.Case
  doctest Day02

  @reports [
    [7, 6, 4, 2, 1],
    [1, 2, 7, 8, 9],
    [9, 7, 6, 2, 1],
    [1, 3, 2, 4, 5],
    [8, 6, 4, 4, 1],
    [1, 3, 6, 7, 9]
  ]

  test "safe? returns true where levels continually increase or decrease, and only by 1-3 per step" do
    assert Day02.safe?(Enum.at(@reports, 0)) == true
    assert Day02.safe?(Enum.at(@reports, 1)) == false
    assert Day02.safe?(Enum.at(@reports, 2)) == false
    assert Day02.safe?(Enum.at(@reports, 3)) == false
    assert Day02.safe?(Enum.at(@reports, 4)) == false
    assert Day02.safe?(Enum.at(@reports, 5)) == true
  end

  test "almost_safe? returns true where safe? would return true were it not for one pesky level" do
    assert Day02.almost_safe?(Enum.at(@reports, 0)) == true
    assert Day02.almost_safe?(Enum.at(@reports, 1)) == false
    assert Day02.almost_safe?(Enum.at(@reports, 2)) == false
    assert Day02.almost_safe?(Enum.at(@reports, 3)) == true
    assert Day02.almost_safe?(Enum.at(@reports, 4)) == true
    assert Day02.almost_safe?(Enum.at(@reports, 5)) == true
  end

  test "part_one counts the number of safe reports" do
    assert Day02.part_one(@reports) == 2
  end

  test "part_two counts the number of almost safe reports" do
    assert Day02.part_one(@reports) == 2
  end
end
