defmodule AoCDay11Test do
  use ExUnit.Case

  @test_input_1 """
  11111
  19991
  19191
  19991
  11111
  """
  @test_input_2 """
  5483143223
  2745854711
  5264556173
  6141336146
  6357385478
  4167524645
  2176841721
  6882881134
  4846848554
  5283751526
  """

  @input """
  2344671212
  6611742681
  5575575573
  3167848536
  1353827311
  4416463266
  2624761615
  1786561263
  3622643215
  4143284653
  """

  test "part1" do
    assert AoC.Day11.part1(@test_input_1, 1) == 9
    assert AoC.Day11.part1(@test_input_1, 2) == 9
    assert AoC.Day11.part1(@test_input_2, 100) == 1656
    assert AoC.Day11.part1(@input, 100) == 1729
  end

  test "part2" do
    assert AoC.Day11.part2(@test_input_2) == 195
    assert AoC.Day11.part2(@input) == 237
  end
end
