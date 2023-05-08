defmodule GuessingGame do
  def compare(secret_number,guess) when is_atom(guess)do
    "Make a guess"
  end

  def compare(secret_number, guess) do
    cond do
     secret_number == guess -> "Correct"
     (secret_number == guess-1) or (secret_number == guess+1) -> "So close"
     secret_number < guess -> "Too high"
     secret_number > guess -> "Too low"
      true -> "Make a guess"
    end
   end

  def compare(secret_number) do
    "Make a guess"
  end

end
