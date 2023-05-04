
defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    discount = (before_discount/100) * discount
    before_discount - discount
  end

  def monthly_rate(hourly_rate, discount) do
      ceil(apply_discount(22 * daily_rate(hourly_rate), discount))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    n = budget * (1 + discount / 100) / daily_rate(hourly_rate)
    floor(n * 10) / 10
  end
end
