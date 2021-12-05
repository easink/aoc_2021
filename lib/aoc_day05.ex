defmodule AoC.Day05 do
  @moduledoc false

  def part1(input) do
    input
    |> parse()
    |> draw_straight_lines()
    |> count_multi()
  end

  def part2(input) do
    input
    |> parse()
    |> draw_lines()
    |> count_multi()
  end

  defp count_multi(diagram) do
    diagram
    |> Map.values()
    |> Enum.filter(&(&1 > 1))
    |> Enum.count()
  end

  defp draw_lines(lines) do
    lines
    |> Enum.flat_map(&line_coords/1)
    |> Enum.reduce(%{}, fn coord, diagram ->
      draw_point(diagram, coord)
    end)
  end

  defp draw_straight_lines(lines) do
    lines
    |> Enum.filter(&straight_line?/1)
    |> draw_lines()
  end

  defp straight_line?({{x, _y1}, {x, _y2}} = _line), do: true
  defp straight_line?({{_x1, y}, {_x2, y}} = _line), do: true
  defp straight_line?(_line), do: false

  def line_coords(line) do
    {{x1, y1}, {x2, y2}} = line
    x_diff = x2 - x1
    x_step = if x_diff == 0, do: 0, else: div(x_diff, abs(x_diff))
    y_diff = y2 - y1
    y_step = if y_diff == 0, do: 0, else: div(y_diff, abs(y_diff))

    line_coords(x1, y1, x2, y2, x_step, y_step, [])
  end

  def line_coords(x, y, x, y, _x_step, _y_step, coords),
    do: [{x, y} | coords]

  def line_coords(x, y, x2, y2, x_step, y_step, coords),
    do: line_coords(x + x_step, y + y_step, x2, y2, x_step, y_step, [{x, y} | coords])

  # defp line_coords(line) do
  #   {{x1, y1}, {x2, y2}} = line

  #   for y <- y1..y2, x <- x1..x2, do: {x, y}
  # end

  defp draw_point(diagram, coord),
    do: Map.update(diagram, coord, 1, fn val -> val + 1 end)

  defp parse(input) do
    input
    |> String.split()
    |> Enum.chunk_every(3)
    |> Enum.map(fn [coord1, "->", coord2] ->
      {parse_coord(coord1), parse_coord(coord2)}
    end)
  end

  defp parse_coord(coord) do
    coord
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple()
  end
end
