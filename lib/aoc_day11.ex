defmodule AoC.Day11 do
  @moduledoc false

  def part1(input, steps) do
    input
    |> parse()
    |> step(steps)
  end

  def part2(input) do
    {octs, _flashes} = parse(input)
    max_flashes = map_size(octs)

    flash_step({octs, 0}, max_flashes, 0)
  end

  def step({_octopuses, flashes}, 0), do: flashes

  def step({octopuses, flashes}, step) do
    octopuses
    |> Map.keys()
    |> Enum.reduce({octopuses, flashes}, fn octopus_coord, acc ->
      energy_inc(acc, octopus_coord)
    end)
    |> level_out()
    |> step(step - 1)
  end

  def flash_step({_octopuses, max_flashes}, max_flashes, step), do: step

  def flash_step({octopuses, _flashes}, max_flashes, step) do
    octopuses
    |> Map.keys()
    |> Enum.reduce({octopuses, 0}, fn octopus_coord, acc ->
      energy_inc(acc, octopus_coord)
    end)
    |> level_out()
    |> flash_step(max_flashes, step + 1)
  end

  def level_out({octopuses, flashes}) do
    Enum.reduce(octopuses, {octopuses, flashes}, fn octopus, {acc, acc_flashes} ->
      {coord, energy} = octopus

      case energy do
        val when val > 9 -> {Map.put(acc, coord, 0), acc_flashes}
        _val -> {acc, acc_flashes}
      end
    end)
  end

  def energy_inc({octopuses, flashes}, octopus_coord) do
    case octopuses[octopus_coord] do
      nil -> {octopuses, flashes}
      9 -> flash({octopuses, flashes + 1}, octopus_coord)
      energy -> {Map.put(octopuses, octopus_coord, energy + 1), flashes}
    end
  end

  def flash({octopuses, flashes}, octopus_coord) do
    octopuses = Map.put(octopuses, octopus_coord, 10)

    octopus_coord
    |> adjacent_coords()
    |> Enum.reduce({octopuses, flashes}, fn adjacent_coord, acc ->
      {octs, _flashes} = acc

      case octs[adjacent_coord] do
        nil -> acc
        _val -> energy_inc(acc, adjacent_coord)
      end
    end)
  end

  def adjacent_coords(octopus_coord) do
    {x, y} = octopus_coord

    for xa <- (x - 1)..(x + 1), ya <- (y - 1)..(y + 1), xa != x or ya != y, do: {xa, ya}
  end

  def parse(input) do
    input
    |> String.split()
    |> Enum.with_index()
    |> Enum.reduce(%{}, fn {x_line, y_index}, acc ->
      x_line
      |> String.split("", trim: true)
      |> Enum.with_index()
      |> Enum.reduce(acc, fn {value, x_index}, x_acc ->
        Map.put(x_acc, {x_index, y_index}, String.to_integer(value))
      end)
    end)
    |> then(fn octs -> {octs, 0} end)
  end
end
