defmodule NameBadge do
  def print(id, name, department) do
    department = if department, do: String.upcase(department), else: "OWNER"


    if is_nil(id) do
    formatted_string = "#{name} - #{department}"
    else
    formatted_string = "[#{id}] - #{name} - #{department}"
    end
  end
end
