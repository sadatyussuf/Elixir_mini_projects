defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    path_list = String.split(path, ".")

     loop_path(data,path_list)

  end

  def get_in_path(data, path) do
     get_in(data, String.split(path, "."))
  end
 defp loop_path(map,[]), do: map
 defp loop_path(map,[key|rest]) do
       loop_path(map[key],rest)
 end

end
