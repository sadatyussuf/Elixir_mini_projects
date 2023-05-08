defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair,1)
  end

  def to_milliliter(volume_pair) do
     {unit,volume} =volume_pair
    cond do
      :cup == unit ->  {:milliliter,volume * 240}
      :fluid_ounce == unit ->  {:milliliter,volume * 30}
      :teaspoon == unit ->  {:milliliter,volume * 5}
      :tablespoon == unit ->  {:milliliter,volume * 15}
      true -> {:milliliter,volume}
    end
  end

  def from_milliliter(volume_pair, unit) do
      {_,volume} =volume_pair
      cond do
      :cup == unit ->  {:cup,volume / 240}
      :fluid_ounce == unit ->  {:fluid_ounce,volume / 30}
      :teaspoon == unit ->  {:teaspoon,volume / 5}
      :tablespoon == unit ->  {:tablespoon,volume / 15}
      true -> {:milliliter,volume}
    end
  end

  def convert(volume_pair, unit) do
      to_mill = to_milliliter(volume_pair)
      from_milliliter(to_mill, unit)

  end
end
