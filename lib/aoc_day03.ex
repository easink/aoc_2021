defmodule AoC.Day03 do
  @moduledoc false
  import Bitwise

  def part1(input) do
    input
    |> parse()
    |> gamma_and_epsilon()
    |> power_consumption()
  end

  def part2(input) do
    oxygen_fn = fn %{0 => zeros, 1 => ones} -> if zeros > ones, do: 0, else: 1 end
    carbon_fn = fn %{0 => zeros, 1 => ones} -> if ones < zeros, do: 1, else: 0 end

    input
    |> parse()
    |> then(fn data -> {rating(data, oxygen_fn), rating(data, carbon_fn)} end)
    |> then(fn {oxygen, carbon} -> oxygen * carbon end)
  end

  def power_consumption({gamma, epsilon, _n}), do: gamma * epsilon

  def gamma_and_epsilon(input) do
    input
    |> Enum.zip()
    |> Enum.map(&Tuple.to_list/1)
    |> Enum.map(&Enum.frequencies/1)
    |> Enum.reverse()
    |> Enum.reduce({0, 0, 0}, fn %{0 => zeros, 1 => ones}, {gamma, epsilon, n} ->
      if ones > zeros,
        do: {gamma + (1 <<< n), epsilon, n + 1},
        else: {gamma, epsilon + (1 <<< n), n + 1}
    end)
  end

  def bits_to_int(bits), do: bits_to_int(Enum.reverse(bits), 0, 0)
  def bits_to_int([], _n, acc), do: acc
  def bits_to_int([0 | bits], n, acc), do: bits_to_int(bits, n + 1, acc)
  def bits_to_int([1 | bits], n, acc), do: bits_to_int(bits, n + 1, acc + (1 <<< n))

  def rating(input, fun) do
    input
    |> rating(fun, 0)
    |> bits_to_int()
  end

  def rating([rating | []], _fun, _n), do: rating

  def rating(ratings, fun, n) do
    ratings
    |> filter(fun.(freq_pos(ratings, n)), n)
    |> rating(fun, n + 1)
  end

  defp freq_pos(ratings, pos) do
    ratings
    |> Enum.zip()
    |> Enum.at(pos)
    |> Tuple.to_list()
    |> Enum.frequencies()
  end

  defp filter(ratings, value, pos) do
    Enum.filter(ratings, fn rating -> value == Enum.at(rating, pos) end)
  end

  defp parse(input) do
    input
    |> String.split()
    |> Enum.map(fn number ->
      number
      |> String.split("", trim: true)
      |> Enum.map(&String.to_integer/1)
    end)
  end
end
