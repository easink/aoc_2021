defmodule AoC.Day09 do
  @moduledoc false

  def part1(input) do
    {max, heightmap} = parse(input)

    heightmap
    |> find_low_points(max)
    |> Enum.map(fn {_coord, value} -> value + 1 end)
    |> Enum.sum()
  end

  def part2(input) do
    {max, heightmap} = parse(input)

    heightmap
    |> find_low_points(max)
    |> Enum.map(fn low_point ->
      find_basin(low_point, heightmap, max, Enum.into([low_point], %{}))
    end)
    |> Enum.map(fn basin -> map_size(basin) end)
    |> Enum.sort()
    |> Enum.reverse()
    |> Enum.take(3)
    |> Enum.product()
  end

  def find_basin({coord, val}, heightmap, max, basin) do
    adjacents = adjacent_points(coord, max)
    new_adjacents = adjacents -- Map.keys(basin)

    Enum.reduce(new_adjacents, basin, fn adjacent, new_basin ->
      adjacent_val = Map.get(heightmap, adjacent)

      if adjacent_val > val and adjacent_val < 9 do
        updated_basin = Map.put(new_basin, adjacent, adjacent_val)

        find_basin({adjacent, adjacent_val}, heightmap, max, updated_basin)
      else
        new_basin
      end
    end)
  end

  def find_low_points(heightmap, max) do
    Enum.filter(heightmap, fn {coord, value} ->
      adjacent_points(coord, max)
      |> Enum.all?(fn point -> Map.get(heightmap, point) > value end)
    end)
  end

  def adjacent_points({x, y}, {x_max, y_max}) do
    Enum.filter(
      [{x, y - 1}, {x, y + 1}, {x - 1, y}, {x + 1, y}],
      fn {x, y} -> x >= 0 and x < x_max and y >= 0 and y < y_max end
    )
  end

  def coords(klist), do: Enum.map(klist, fn {coord, _val} -> coord end)

  def parse(input) do
    input
    |> String.split()
    |> Enum.map(&String.split(&1, "", trim: true))
    |> x_y_parse()
  end

  def x_y_parse(parsed) do
    y = length(parsed)
    x = parsed |> List.first() |> length

    heightmap =
      parsed
      |> Enum.with_index()
      |> Enum.reduce(%{}, fn {x_line, y_index}, acc ->
        x_line
        |> Enum.with_index()
        |> Enum.reduce(acc, fn {value, x_index}, x_acc ->
          Map.put(x_acc, {x_index, y_index}, String.to_integer(value))
        end)
      end)

    {{x, y}, heightmap}
  end
end
