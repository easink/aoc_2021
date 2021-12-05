defmodule AoC.Day04 do
  @moduledoc false

  @win_coords (for y <- 0..4 do
                 for x <- 0..4, do: {x, y}
               end) ++
                (for x <- 0..4 do
                   for y <- 0..4, do: {x, y}
                 end)

  def part1(input) do
    input
    |> parse()
    |> play()
    |> sum_unmarked_board()
  end

  def part2(input) do
    input
    |> parse()
    |> play_last()
    |> sum_unmarked_board()
  end

  defp sum_unmarked_board({number, winning_boards, _not_winning_boards}) do
    [{board, marked}] = winning_boards

    board_numbers = Map.keys(board)
    marked_numbers = Map.keys(marked)

    number * Enum.sum(board_numbers -- marked_numbers)
  end

  defp play_last({order, boards}) do
    boards = Enum.map(boards, fn board -> {board, %{}} end)
    play_last(order, boards)
  end

  defp play_last(order, boards)
       when length(boards) == 1,
       do: play(order, boards)

  defp play_last(order, boards) do
    {_number, _winning_boards, not_winning_boards} = play(order, boards)
    play_last(tl(order), not_winning_boards)
  end

  defp play({order, boards}) do
    boards = Enum.map(boards, fn board -> {board, %{}} end)
    play(order, boards)
  end

  defp play([number | order], boards) do
    boards =
      Enum.map(boards, fn {board, marked} ->
        marked = mark_board(number, board, marked)
        {board, marked}
      end)

    case Enum.split_with(boards, fn {_board, marked} -> win?(Map.values(marked)) end) do
      {[], not_winning_boards} -> play(order, not_winning_boards)
      {winning_boards, not_winning_boards} -> {number, winning_boards, not_winning_boards}
    end
  end

  defp win?(coords) do
    Enum.any?(@win_coords, fn win_coords ->
      a = MapSet.new(win_coords)
      b = MapSet.new(coords -- coords -- win_coords)
      MapSet.equal?(a, b)
    end)
  end

  defp mark_board(number, board, marked) do
    case Map.get(board, number) do
      nil -> marked
      coord -> Map.put(marked, number, coord)
    end
  end

  defp parse(input) do
    [order | boards] = String.split(input)

    order =
      order
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)

    boards =
      boards
      |> Enum.map(&String.to_integer/1)
      |> Enum.chunk_every(5 * 5)

    boards =
      boards
      |> Enum.map(fn board ->
        coords = for y <- 0..4, x <- 0..4, do: {x, y}

        board
        |> Enum.zip(coords)
        |> Enum.into(%{})
      end)

    {order, boards}
  end
end
