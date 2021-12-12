defmodule AoCDay12Test do
  use ExUnit.Case

  @test_input_1 """
  start-A
  start-b
  A-c
  A-b
  b-d
  A-end
  b-end
  """

  @test_input_2 """
  dc-end
  HN-start
  start-kj
  dc-start
  dc-HN
  LN-dc
  HN-end
  kj-sa
  kj-HN
  kj-dc
  """

  @test_input_3 """
  fs-end
  he-DX
  fs-he
  start-DX
  pj-DX
  end-zg
  zg-sl
  zg-pj
  pj-he
  RW-he
  fs-DX
  pj-RW
  zg-RW
  start-pj
  he-WI
  zg-he
  pj-fs
  start-RW
  """

  @input """
  pn-TY
  rp-ka
  az-aw
  al-IV
  pn-co
  end-rp
  aw-TY
  rp-pn
  al-rp
  end-al
  IV-co
  end-TM
  co-TY
  TY-ka
  aw-pn
  aw-IV
  pn-IV
  IV-ka
  TM-rp
  aw-PD
  start-IV
  start-co
  start-pn
  """

  test "part1" do
    assert AoC.Day12.part1(@test_input_1) == 10
    assert AoC.Day12.part1(@test_input_2) == 19
    assert AoC.Day12.part1(@test_input_3) == 226
    assert AoC.Day12.part1(@input) == 4413
  end

  test "part2" do
    assert AoC.Day12.part2(@test_input_1) == 36
    assert AoC.Day12.part2(@test_input_2) == 103
    assert AoC.Day12.part2(@test_input_3) == 3509
    assert AoC.Day12.part2(@input) == 118_803
  end
end
