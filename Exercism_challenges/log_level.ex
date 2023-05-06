defmodule LogLevel do
  defp log_codes(level,legacy?) do
     hashmap = %{0=> [:trace,false] ,
                 1=> [:debug,true],
                 2=> [:info,true],
                 3=> [:warning,true],
                 4=> [:error,true],
                 5=> [:fatal,false]
}
    Map.get(hashmap, level,[:unknown,legacy?])
  end

  def to_label(level, legacy?) do
    [log, bool] = log_codes(level,legacy?)
    cond do
      (legacy? == bool) or (bool == true) -> log
       true -> :unknown
     end

  end

  def alert_recipient(level, legacy?) do
     msg = to_label(level, legacy?)
     cond do
       msg == :fatal or msg == :error -> :ops
       msg == :unknown and legacy? == true -> :dev1
       msg == :unknown and legacy? == false -> :dev2
       true -> false
      end
  end
end
