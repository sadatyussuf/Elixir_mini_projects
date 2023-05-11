defmodule BirdCount do
  def today([]), do: nil
  def today(list) do
    hd(list)
  end

  def increment_day_count([]), do: [1]
  def increment_day_count(list) do
    [hd | tl] = list
    [hd+1| tl]

  end

  def has_day_without_birds?(list) do
    cond do
    0 in list -> true
    true -> false
    end
  end

  def total(list) do
    Enum.reduce(list, 0, fn x, acc -> x + acc end)
  end


  def busy_days(list) do
    list
     |> Enum.filter(&(&1 >= 5))
    |> Enum.count()
  end
end
