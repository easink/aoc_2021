defmodule AoC.Day12 do
  @moduledoc false

  def part1(input) do
    input
    |> parse()
    |> traverse("start", [], 0)
  end

  def part2(input) do
    input
    |> parse()
    |> traverse2("start", [], nil, 0)
  end

  def traverse(_tree, "end", _been, n), do: n + 1

  def traverse(tree, pos, been, n) do
    been = if small_cave?(pos), do: [pos | been], else: been

    linked_nodes = tree[pos]

    Enum.reduce(linked_nodes, n, fn node, acc ->
      if node in been,
        do: acc,
        else: traverse(tree, node, been, acc)
    end)
  end

  def traverse2(tree, pos, been, extra, n) do
    linked_nodes = tree[pos]

    Enum.reduce(linked_nodes, n, fn node, acc ->
      next_been = [node | been]

      cond do
        node == "start" -> acc
        node == "end" -> acc + 1
        not small_cave?(node) -> traverse2(tree, node, next_been, extra, acc)
        node in been and extra == nil -> traverse2(tree, node, next_been, node, acc)
        node in been -> acc
        true -> traverse2(tree, node, next_been, extra, acc)
      end
    end)
  end

  def small_cave?(node), do: Regex.match?(~r/^[a-z]/, node)

  def parse(input) do
    input
    |> String.split()
    |> Enum.reduce(%{}, fn line, acc ->
      [from, to] = String.split(line, "-")

      acc
      |> add_link(from, to)
      |> add_link(to, from)
    end)
  end

  def add_link(tree, from, to) do
    Map.update(tree, from, [to], fn nodes -> [to | nodes] end)
  end
end
