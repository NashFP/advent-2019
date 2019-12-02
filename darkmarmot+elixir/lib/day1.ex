defmodule AOC.Day1 do

  def run do
    IO.inspect(part1())
    IO.inspect(part2())
  end

  def part1 do
    AOC.integer_stream(1)
    |> Enum.reduce(0, fn mass, acc -> fuel(mass) + acc end)
  end

  def part2 do
    AOC.integer_stream(1)
    |> Stream.map(&fuel/1)
    |> Enum.reduce(0, fn mass, acc -> add_fuel(mass) + acc end)
  end

  def fuel(mass) do
    max(0, trunc(mass / 3) - 2)
  end

  def add_fuel(mass) do
    case fuel(mass) do
      0 -> 0
      f -> mass + add_fuel(f)
    end
  end

end
