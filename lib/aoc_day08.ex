defmodule AoC.Day08 do
  @moduledoc false

  @unique_digit_lengths [2, 3, 4, 7]
  @all_segments MapSet.new(~w(a b c d e f g))

  def part1(input) do
    input
    |> parse()
    |> find_unique_digits()
    |> length
  end

  def part2(input) do
    input
    |> parse()
    |> Enum.map(&calc_digits/1)
    |> Enum.sum()
  end

  def calc_digits({digit_sets, entry}) do
    all = all_digits(digit_sets)

    entry
    |> Enum.map(fn digit -> Map.get(all, digit) end)
    |> Enum.reduce(fn num, acc -> acc * 10 + num end)
  end

  def all_digits(digit_sets) do
    one = Enum.find(digit_sets, fn digit -> MapSet.size(digit) == 2 end)
    four = Enum.find(digit_sets, fn digit -> MapSet.size(digit) == 4 end)
    seven = Enum.find(digit_sets, fn digit -> MapSet.size(digit) == 3 end)
    eight = Enum.find(digit_sets, fn digit -> MapSet.size(digit) == 7 end)

    # remove unique
    digit_sets = digit_sets -- [one, four, seven, eight]

    # four -> nine
    nine = Enum.find(digit_sets, fn digit -> MapSet.subset?(four, digit) end)

    digit_sets = List.delete(digit_sets, nine)

    # segment e missing in nine
    segment_e = MapSet.difference(@all_segments, nine)

    # segment e exist in zero, two and six
    zero_two_six = Enum.filter(digit_sets, fn digit -> MapSet.subset?(segment_e, digit) end)

    three_five = digit_sets -- zero_two_six

    # two has size 5, zero and six has 6
    two = Enum.find(zero_two_six, fn digit -> MapSet.size(digit) == 5 end)
    zero_six = zero_two_six -- [two]

    # zero has one as subset, not six
    zero = Enum.find(zero_six, fn digit -> MapSet.subset?(one, digit) end)
    [six] = zero_six -- [zero]

    # zero has one as subset, not five
    three = Enum.find(three_five, fn digit -> MapSet.subset?(one, digit) end)
    [five] = three_five -- [three]

    %{zero => 0, one => 1, two => 2, three => 3, four => 4, five => 5, six => 6, seven => 7, eight => 8, nine => 9}
  end

  def find_unique_digits(digits) do
    digits
    |> Enum.flat_map(fn {_all, four} -> four end)
    |> Enum.map(fn digit -> MapSet.size(digit) end)
    |> Enum.filter(fn len -> len in @unique_digit_lengths end)
  end

  def parse(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      [a, b] = String.split(line, " | ")
      {str2set(a), str2set(b)}
    end)
  end

  def str2set(string) do
    string
    |> String.split()
    |> Enum.map(&String.split(&1, "", trim: true))
    |> Enum.map(&MapSet.new/1)
  end
end
