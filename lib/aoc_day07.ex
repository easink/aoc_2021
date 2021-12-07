defmodule AoC.Day07 do
  @moduledoc false

  def part1(input) do
    input
    |> fuel(&fuel_pos/2)
  end

  def part2(input) do
    input
    |> fuel(&fuel_pos2/2)
  end

  def fuel(input, calc) do
    {min, max} = Enum.min_max(input)

    min..max
    |> Enum.map(fn to_pos -> {calc.(input, to_pos), to_pos} end)
    |> Enum.sort()
    |> List.first()
    |> elem(0)
  end

  def fuel_pos(input, to_pos) do
    input
    |> Enum.map(fn pos -> abs(pos - to_pos) end)
    |> Enum.sum()
  end

  def fuel_pos2(input, to_pos) do
    input
    |> Enum.map(fn pos ->
      steps = abs(pos - to_pos)
      div(steps * (steps + 1), 2)
    end)
    |> Enum.sum()
  end
end
