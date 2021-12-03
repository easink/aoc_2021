defmodule AoC.Day02 do
  @moduledoc false

  def part1(input) do
    input
    |> parse()
    |> transport()
    |> direction()
  end

  def part2(input) do
    input
    |> parse()
    |> transport_aim()
    |> direction()
  end

  defp direction({x, y}), do: x * y
  defp direction({x, y, _aim}), do: x * y

  defp transport(commands) do
    commands
    |> Enum.reduce({0, 0}, fn
      {:forward, count}, {x, y} -> {x + count, y}
      {:up, count}, {x, y} -> {x, y - count}
      {:down, count}, {x, y} -> {x, y + count}
    end)
  end

  defp transport_aim(commands) do
    commands
    |> Enum.reduce({0, 0, 0}, fn
      {:forward, count}, {x, y, aim} -> {x + count, y + aim * count, aim}
      {:up, count}, {x, y, aim} -> {x, y, aim - count}
      {:down, count}, {x, y, aim} -> {x, y, aim + count}
    end)
  end

  defp parse(input) do
    input
    |> String.split()
    |> Enum.chunk_every(2)
    |> Enum.map(fn [dir, count] ->
      {String.to_atom(dir), String.to_integer(count)}
    end)
  end
end
