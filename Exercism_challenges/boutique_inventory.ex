defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, &(&1.price), :asc)
  end

  def with_missing_price(inventory) do
   Enum.reject(inventory, fn x -> x.price end)
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn x -> Map.put(x, :name,String.replace(x.name, old_word, new_word)) end)

  end

  def increase_quantity(item, count) do
     res =  item.quantity_by_size
     |> Enum.map(fn {x,y} -> {x, y + count} end)
     |> Map.new
    Map.put(item,:quantity_by_size,res)
  end

  def total_quantity(item) do
    item.quantity_by_size
     |> Enum.reduce( 0, fn {x,y}, acc -> y + acc end)
  end
end
