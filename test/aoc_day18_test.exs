defmodule AoCDay18Test do
  use ExUnit.Case

  @test_input_1 """
  [1,1]
  [2,2]
  [3,3]
  [4,4]
  """
  @test_input_2 """
  [1,1]
  [2,2]
  [3,3]
  [4,4]
  [5,5]
  """

  @test_input_3 """
  [1,1]
  [2,2]
  [3,3]
  [4,4]
  [5,5]
  [6,6]
  """

  @test_input """
  [[[0,[5,8]],[[1,7],[9,6]]],[[4,[1,2]],[[1,4],2]]]
  [[[5,[2,8]],4],[5,[[9,9],0]]]
  [6,[[[6,2],[5,6]],[[7,6],[4,7]]]]
  [[[6,[0,7]],[0,9]],[4,[9,[9,0]]]]
  [[[7,[6,4]],[3,[1,3]]],[[[5,5],1],9]]
  [[6,[[7,3],[3,2]]],[[[3,8],[5,7]],4]]
  [[[[5,4],[7,7]],8],[[8,3],8]]
  [[9,3],[[9,9],[6,[4,9]]]]
  [[2,[[7,7],7]],[[5,8],[[9,3],[0,2]]]]
  [[[[5,2],5],[8,[3,7]]],[[5,[7,5]],[4,4]]]
  """

  @input """
  [[0,[[0,9],[6,5]]],[[[5,3],[0,4]],[8,3]]]
  [[[[8,6],4],[2,5]],[[[7,4],[4,3]],[[3,4],[3,3]]]]
  [[[6,[0,2]],[5,[7,4]]],[1,2]]
  [[[[5,4],0],[[5,3],[1,4]]],[[[8,9],[0,0]],1]]
  [[[7,0],2],[0,[4,2]]]
  [4,[6,2]]
  [[[[9,5],[3,4]],[[9,4],[5,3]]],[5,[[0,3],[4,4]]]]
  [[[6,0],[3,4]],[9,[[0,3],3]]]
  [[[[4,0],5],2],[[4,7],[9,0]]]
  [[[2,4],[[3,6],[5,5]]],[[9,[1,1]],[1,1]]]
  [[[[8,8],1],8],0]
  [[0,6],[[[1,1],8],[[1,7],[6,3]]]]
  [[4,8],[[1,[8,4]],[[5,9],[6,3]]]]
  [3,[[0,[0,8]],[[2,5],9]]]
  [[[[8,8],[5,8]],[[5,2],3]],[[[6,5],2],[6,8]]]
  [[[5,[0,8]],[[8,3],[0,4]]],[[[2,5],8],[[0,4],3]]]
  [[[7,5],2],[[[3,6],[1,7]],[1,[6,2]]]]
  [[[[7,7],1],4],[[8,[5,1]],4]]
  [[[[5,0],[9,0]],[[3,3],[1,0]]],[[0,[8,9]],7]]
  [[[[4,0],[8,9]],[1,9]],[[[1,7],[9,5]],[[1,4],[9,5]]]]
  [[7,0],5]
  [[[[3,7],3],[[1,1],[4,9]]],[2,[6,3]]]
  [[2,[6,[4,4]]],[0,[0,[6,3]]]]
  [[[3,[5,3]],4],[0,4]]
  [7,[[[8,8],[6,3]],[9,5]]]
  [[7,[4,4]],[5,7]]
  [[6,3],[[2,0],[9,6]]]
  [[[0,[7,9]],[[5,6],0]],[[4,[8,9]],[8,[3,6]]]]
  [[5,[3,[7,0]]],[[4,1],[[1,1],[3,0]]]]
  [[9,[2,4]],[[2,[8,1]],[[4,5],1]]]
  [[8,[0,[8,2]]],[[2,4],[[2,6],8]]]
  [[[[8,1],5],2],[0,[[5,7],8]]]
  [[[[9,2],[6,0]],[3,[9,6]]],[[[2,1],0],[[6,2],[2,0]]]]
  [[[[6,6],1],[2,3]],[9,[[4,8],5]]]
  [[3,[[1,5],[8,4]]],[[6,6],3]]
  [[[4,8],5],3]
  [[0,[[5,4],[9,7]]],[[[0,5],[7,6]],[[6,9],[1,9]]]]
  [[[9,[1,1]],[7,[2,9]]],[[6,[3,6]],[[4,5],[1,0]]]]
  [[[5,[7,7]],9],2]
  [1,[[0,[3,2]],[1,[8,7]]]]
  [5,[[5,[3,5]],[[4,1],[8,3]]]]
  [[0,4],[[[2,6],7],3]]
  [5,9]
  [[[[9,2],[3,9]],3],[0,[[8,4],0]]]
  [[[9,7],[6,[3,3]]],3]
  [2,[[4,0],[8,[8,4]]]]
  [[2,4],[9,[[2,9],4]]]
  [[[[9,7],[9,5]],[[9,2],[3,9]]],0]
  [2,[0,[[2,2],6]]]
  [[[[8,9],[7,9]],[3,[1,4]]],[[1,[9,5]],[[1,9],7]]]
  [[[1,[3,6]],0],[9,[8,[2,2]]]]
  [[[7,3],[[7,2],[4,3]]],[[9,[7,7]],7]]
  [[[3,[6,4]],4],[[[8,9],[6,6]],[1,[9,1]]]]
  [[[[6,3],[1,8]],[6,9]],[[[0,0],2],0]]
  [[[8,9],7],1]
  [[[[3,2],[7,5]],2],9]
  [[[[4,9],5],4],[0,[[2,4],[7,8]]]]
  [[[[8,1],[6,5]],[[8,1],[9,7]]],9]
  [0,[1,6]]
  [[[5,9],[[9,8],6]],[0,[5,[1,2]]]]
  [9,[[[4,3],5],[9,3]]]
  [[[9,[2,7]],[2,[9,0]]],[[1,[8,7]],[[3,5],[2,6]]]]
  [9,[[3,8],[[4,5],[7,1]]]]
  [[0,[2,8]],[[6,3],5]]
  [[[6,[2,5]],[[2,1],8]],[5,[[4,9],[0,3]]]]
  [[[[0,4],3],[[1,3],[3,2]]],9]
  [9,[[2,8],[[3,8],7]]]
  [[[4,[1,9]],[3,3]],[0,[[4,3],[1,7]]]]
  [[6,[[5,2],[2,5]]],[1,[[0,0],[1,4]]]]
  [9,[1,[7,[5,6]]]]
  [[5,4],6]
  [6,[[5,6],7]]
  [[[3,[6,0]],[8,[3,5]]],[[5,1],[[7,9],3]]]
  [[[6,[8,7]],[[5,2],0]],[[6,[4,0]],[1,[1,2]]]]
  [3,[[[7,8],0],[[6,5],0]]]
  [[4,9],[9,9]]
  [[7,[5,[9,7]]],1]
  [[[3,[3,3]],[4,6]],[[[9,5],[4,8]],[5,[2,0]]]]
  [[[[8,6],6],8],[3,1]]
  [6,[5,0]]
  [2,[[2,[7,5]],[6,[0,6]]]]
  [[[9,[1,3]],[0,[9,4]]],4]
  [[[[2,5],[9,9]],[[8,2],2]],[9,[1,[9,1]]]]
  [[[[8,9],0],[[2,5],[2,2]]],[[7,[4,1]],[[3,9],[5,8]]]]
  [[[7,6],[6,3]],5]
  [2,[[[5,8],[1,2]],0]]
  [[[8,7],[6,4]],[[[0,6],2],[[2,1],5]]]
  [2,1]
  [0,[[[4,3],[6,6]],8]]
  [4,2]
  [[[6,[3,2]],[5,[2,3]]],[[[3,5],[6,2]],[1,[6,6]]]]
  [[0,[[8,1],[0,5]]],[[[3,3],3],[[6,8],5]]]
  [[[3,0],[4,[6,5]]],[[[3,3],[4,0]],6]]
  [[[[7,3],4],4],[[7,[8,2]],0]]
  [[[4,3],[0,9]],[[1,[8,9]],[[3,0],0]]]
  [[3,2],[2,[[2,6],[2,1]]]]
  [2,8]
  [[[[1,4],[7,3]],[8,[2,1]]],4]
  [[[1,7],[1,[4,8]]],[[[2,2],[6,1]],[[9,9],8]]]
  [[[5,[7,2]],[[8,6],6]],[1,5]]
  """

  test "part1" do
    assert parser("[[[[[9,8],1],2],3],4]") == "[[[[09]2]3]4]"
    assert parser("[7,[6,[5,[4,[3,2]]]]]") == "[7[6[5[70]]]]"
    assert parser("[[6,[5,[4,[3,2]]]],1]") == "[[6[5[70]]]3]"
    # assert parser("[[3,[2,[1,[7,3]]]],[6,[5,[4,[3,2]]]]]") == "[[3[2[80]]][9[5[4[32]]]]]"
    # assert parser("[[3,[2,[8,0]]],[9,[5,[4,[3,2]]]]]") == "[[3[2[80]]][9[5[70]]]]"
    assert parser("[[3,[2,[1,[7,3]]]],[6,[5,[4,[3,2]]]]]") == "[[3[2[80]]][9[5[70]]]]"

    assert parser("[[[[[4,3],4],4],[7,[[8,4],9]]],[1,1]]") == "[[[[07]4][[78][60]]][81]]"

    assert AoC.Day18.part1("[[1,2],[[3,4],5]]") == 143
    assert AoC.Day18.part1("[[[[0,7],4],[[7,8],[6,0]]],[8,1]]") == 1384
    assert AoC.Day18.part1("[[[[1,1],[2,2]],[3,3]],[4,4]]") == 445
    assert AoC.Day18.part1("[[[[3,0],[5,3]],[4,4]],[5,5]]") == 791
    assert AoC.Day18.part1("[[[[5,0],[7,4]],[5,5]],[6,6]]") == 1137
    assert AoC.Day18.part1("[[[[8,7],[7,7]],[[8,6],[7,7]]],[[[0,7],[6,6]],[8,7]]]") == 3488

    assert parser(@test_input_1) == "[[[[11][22]][33]][44]]"
    assert parser(@test_input_2) == "[[[[30][53]][44]][55]]"
    assert parser(@test_input_3) == "[[[[50][74]][55]][66]]"

    test_input_4 = """
    [[[0,[4,5]],[0,0]],[[[4,5],[2,6]],[9,5]]]
    [7,[[[3,7],[4,3]],[[6,3],[8,8]]]]
    [[2,[[0,8],[3,4]]],[[[6,7],1],[7,[1,6]]]]
    [[[[2,4],7],[6,[0,5]]],[[[6,8],[2,8]],[[2,1],[4,5]]]]
    [7,[5,[[3,8],[1,4]]]]
    [[2,[2,2]],[8,[8,1]]]
    [2,9]
    [1,[[[9,3],9],[[9,0],[0,7]]]]
    [[[5,[7,4]],7],1]
    [[[[4,2],2],6],[8,7]]
    """

    assert parser(test_input_4) == "[[[[87][77]][[86][77]]][[[07][66]][87]]]"
    assert AoC.Day18.part1(@test_input) == 4140
    assert AoC.Day18.part1(@input) == 3884
  end

  test "part2" do
    assert AoC.Day18.part2(@test_input) == 3993
    assert AoC.Day18.part2(@input) == 4595
  end

  defp parser(input) do
    input
    |> AoC.Day18.parse()
    |> AoC.Day18.add_lines()
    |> Enum.join()
  end
end