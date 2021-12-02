defmodule AoC.Day01 do
  @moduledoc false

  def part1(input) do
    count_increase(input)
  end

  def part2(input) do
    input
    |> sum_up()
    |> count_increase()
  end

  def sum_up([_a | [_b | b_tail] = a_tail] = input) do
    [input, a_tail, b_tail]
    |> Enum.zip()
    |> Enum.map(fn {a, b, c} -> a + b + c end)
  end

  def count_increase([_head | tail] = list) do
    list
    |> Enum.zip(tail)
    |> Enum.filter(fn {a, b} -> b > a end)
    |> Enum.count()
  end
end
