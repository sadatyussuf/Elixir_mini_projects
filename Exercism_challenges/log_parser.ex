defmodule LogParser do
  def valid_line?(line) do
   line =~ ~r/^\[(DEBUG|INFO|WARNING|ERROR)\]/
  end

  def split_line(line) do
    separator_regex = ~r/<[~*=~-]*>/
    String.split(line, separator_regex)
  end

  def remove_artifacts(line) do
    cleaned_line = String.replace(line, ~r/end-of-line\d+/i, "")
    cleaned_line
  end

  def tag_with_user_name(line) do
     is_match? = String.match?(line, ~r/User/)

     if is_match? do
      username = Regex.run(~r/User\s+(\S+)/, line) |> List.last
      "[USER] #{username} " <> line

     else
        line
     end
  end
end
