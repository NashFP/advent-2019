defmodule AOC do

  def data_path(day) do
    Path.join([Application.app_dir(:aoc, "priv"), "day#{day}.txt"])
  end

  def line_stream(day) do
    day
    |> data_path()
    |> File.stream!()
    |> Stream.map(&String.trim/1)
  end

  def integer_stream(day) do
    day
    |> line_stream()
    |> Stream.map(&String.to_integer/1)
  end

  def comma_nums(day) do
    day
    |> data_path()
    |> File.read!()
    |> String.split(",")
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.to_integer/1)
  end

end