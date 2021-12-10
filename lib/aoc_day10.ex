defmodule AoC.Day10 do
  @moduledoc false

  @corrupt_score %{
    ?) => 3,
    ?] => 57,
    ?} => 1197,
    ?> => 25137
  }

  @incomplete_score %{
    ?) => 1,
    ?] => 2,
    ?} => 3,
    ?> => 4
  }

  def part1(input) do
    input
    |> parse()
    |> Enum.map(&syntax_parser(&1, []))
    |> Enum.filter(fn item -> match?({:corrupt, _val}, item) end)
    |> Enum.map(fn {:corrupt, val} -> val end)
    |> Enum.map(fn char -> @corrupt_score[char] end)
    |> Enum.sum()
  end

  def part2(input) do
    input
    |> parse()
    |> Enum.map(&syntax_parser(&1, []))
    |> Enum.filter(fn item -> match?({:incomplete, _val}, item) end)
    |> Enum.map(fn {:incomplete, val} -> val end)
    |> Enum.map(&fix_incomplete(&1, []))
    |> Enum.map(fn fix ->
      Enum.reduce(fix, 0, fn char, acc ->
        5 * acc + @incomplete_score[char]
      end)
    end)
    |> Enum.sort()
    |> then(fn values ->
      len = length(values)
      idx = div(len, 2)
      Enum.at(values, idx)
    end)
  end

  def fix_incomplete([], fix), do: Enum.reverse(fix)
  def fix_incomplete([?( | parsed], fix), do: fix_incomplete(parsed, [?) | fix])
  def fix_incomplete([?[ | parsed], fix), do: fix_incomplete(parsed, [?] | fix])
  def fix_incomplete([?{ | parsed], fix), do: fix_incomplete(parsed, [?} | fix])
  def fix_incomplete([?< | parsed], fix), do: fix_incomplete(parsed, [?> | fix])

  def syntax_parser([], []), do: :ok
  def syntax_parser([], parsed), do: {:incomplete, parsed}
  def syntax_parser([?) | rest], [?( | parsed]), do: syntax_parser(rest, parsed)
  def syntax_parser([?} | rest], [?{ | parsed]), do: syntax_parser(rest, parsed)
  def syntax_parser([?] | rest], [?[ | parsed]), do: syntax_parser(rest, parsed)
  def syntax_parser([?> | rest], [?< | parsed]), do: syntax_parser(rest, parsed)
  def syntax_parser([?( | rest], parsed), do: syntax_parser(rest, [?( | parsed])
  def syntax_parser([?{ | rest], parsed), do: syntax_parser(rest, [?{ | parsed])
  def syntax_parser([?[ | rest], parsed), do: syntax_parser(rest, [?[ | parsed])
  def syntax_parser([?< | rest], parsed), do: syntax_parser(rest, [?< | parsed])
  def syntax_parser([char | _rest], _parsed), do: {:corrupt, char}

  def parse(input) do
    input
    |> String.split()
    |> Enum.map(fn line -> to_charlist(line) end)
  end
end
