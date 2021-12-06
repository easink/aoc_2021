defmodule AoC.Day06 do
  @moduledoc false

  def part1(input, ticks) do
    input
    |> fish_generations(ticks)
    |> length
  end

  def part2(input, ticks) do
    for(k <- 0..8, into: %{}, do: {k, 0})
    |> Map.merge(Enum.frequencies(input))
    |> fish_calc(ticks)
    |> Map.values()
    |> Enum.sum()
  end

  def fish_generations(generations, 0), do: generations

  def fish_generations(generations, ticks) do
    generations
    |> Enum.flat_map(fn
      0 -> [6, 8]
      age -> [age - 1]
    end)
    |> Enum.sort()
    |> fish_generations(ticks - 1)
  end

  def fish_calc(generations, 0), do: generations

  def fish_calc(generations, ticks) do
    seven = Map.get(generations, 7)

    Enum.flat_map(generations, fn
      {0, num} -> [{8, num}, {6, num + seven}]
      {7, _num} -> []
      {age, num} -> [{age - 1, num}]
    end)
    |> Enum.into(%{})
    |> fish_calc(ticks - 1)
  end
end
