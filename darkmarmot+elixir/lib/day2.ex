defmodule AOC.Day2 do

  @day_num 2

  def run do
#    IO.inspect(part1())
#    IO.inspect(part2())
  end

  def part1 do
    m = AOC.comma_nums(@day_num)
    |> Enum.with_index()
    |> Enum.map(fn {k, v} -> {v, k} end)
    |> Map.new()
    |> Map.put(1, 12)
    |> Map.put(2, 2)
    |> run_opcode(0)
    |> Map.get(0)
#    |> Enum.reduce(0, fn mass, acc -> fuel(mass) + acc end)
  end


  def part2 do

    for p1 <- 0..99 do
      for p2 <- 0..99 do
        v = AOC.comma_nums(@day_num) |> array_map() |> Map.put(1, p1) |> Map.put(2, p2) |> run_opcode(0) |> Map.get(0)
        if v == 19690720, do: IO.inspect("#{p1} #{p2} #{v}")
      end
    end


#    AOC.integer_stream(@day_num)
#    |> Stream.map(&fuel/1)
#    |> Enum.reduce(0, fn mass, acc -> add_fuel(mass) + acc end)
  end

  def array_map(list) do
    list
    |> Enum.with_index()
    |> Enum.map(fn {k, v} -> {v, k} end)
    |> Map.new()
  end

  def run_opcode(map, pos) do

    oc = Map.get(map, pos)
    p1 = Map.get(map, pos + 1)
    p2 = Map.get(map, pos + 2)
    p3 = Map.get(map, pos + 3)
    v1 = Map.get(map, p1)
    v2 = Map.get(map, p2)

    new_map =
      case oc do
      1 ->
        Map.put(map, p3, v1 + v2)
        |> run_opcode(pos + 4)
      2 ->
        Map.put(map, p3, v1 * v2)
        |> run_opcode(pos + 4)
      99 -> map

    end
  end
end
