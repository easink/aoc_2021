defmodule AoCDay14Test do
  use ExUnit.Case

  @test_input """
  NNCB

  CH -> B
  HH -> N
  CB -> H
  NH -> C
  HB -> C
  HC -> B
  HN -> C
  NN -> C
  BH -> H
  NC -> B
  NB -> B
  BN -> B
  BB -> N
  BC -> B
  CC -> N
  CN -> C
  """

  @input """
  OHFNNCKCVOBHSSHONBNF

  SV -> O
  KP -> H
  FP -> B
  VP -> V
  KN -> S
  KS -> O
  SB -> K
  BS -> K
  OF -> O
  ON -> S
  VS -> F
  CK -> C
  FB -> K
  CH -> K
  HS -> H
  PO -> F
  NP -> N
  FH -> C
  FO -> O
  FF -> C
  CO -> K
  NB -> V
  PP -> S
  BB -> N
  HH -> B
  KK -> H
  OP -> K
  OS -> V
  KV -> F
  VH -> F
  OB -> S
  CN -> H
  SF -> K
  SN -> P
  NF -> H
  HB -> V
  VC -> S
  PS -> P
  NK -> B
  CV -> P
  BC -> S
  NH -> K
  FN -> P
  SH -> F
  FK -> P
  CS -> O
  VV -> H
  OC -> F
  CC -> N
  HK -> N
  FS -> P
  VF -> B
  SS -> V
  PV -> V
  BF -> V
  OV -> C
  HO -> F
  NC -> F
  BN -> F
  HC -> N
  KO -> P
  KH -> F
  BV -> S
  SK -> F
  SC -> F
  VN -> V
  VB -> V
  BH -> O
  CP -> K
  PK -> K
  PB -> K
  FV -> S
  HN -> K
  PH -> B
  VK -> B
  PC -> H
  BO -> H
  SP -> V
  NS -> B
  OH -> N
  KC -> H
  HV -> F
  HF -> B
  HP -> S
  CB -> P
  PN -> S
  BK -> K
  PF -> N
  SO -> P
  CF -> B
  VO -> C
  OO -> K
  FC -> F
  NV -> F
  OK -> K
  NN -> O
  NO -> O
  BP -> O
  KB -> O
  KF -> O
  """

  test "part1" do
    assert AoC.Day14.part1(@test_input, 10) == 1588
    assert AoC.Day14.part1(@input, 10) == 2590
  end

  test "part2" do
    assert AoC.Day14.part2(@test_input, 40) == 2_188_189_693_529
    assert AoC.Day14.part2(@input, 40) == 2_875_665_202_438
  end
end
