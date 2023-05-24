defmodule LibraryFees do
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    noon = ~T[12:00:00]
    check_out = NaiveDateTime.to_time(datetime)

    case Time.compare(check_out, noon) do
     :lt -> true
     _ -> false
    end
  end

  def return_date(checkout_datetime) do
    day = 60*60*24
    if before_noon?(checkout_datetime) do
     n_date = NaiveDateTime.add(checkout_datetime, day*28)
     NaiveDateTime.to_date(n_date)
    else
     n_date = NaiveDateTime.add(checkout_datetime, day*29)
     NaiveDateTime.to_date(n_date)
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
    actual_dt = NaiveDateTime.to_date(actual_return_datetime)
    diff_dt = Date.diff(actual_dt, planned_return_date)
    res = if diff_dt > 0, do: diff_dt, else: 0
    #res = if diff_dt < 0, do: 0, else: diff_dt
  end

  def monday?(datetime) do
    dt = NaiveDateTime.to_date(datetime)
    res = if Date.day_of_week(dt) == 1, do: true, else: false
  end

  def calculate_late_fee(checkout, return, rate) do
    checkout = return_date(datetime_from_string(checkout))
    return = datetime_from_string(return)
    days_late = days_late(checkout,return)
    monday? = monday?(return)
    fee = days_late * rate

   if monday? do
      discount = (0.5 * fee)

      fee - round(discount)
    else
       fee
    end
  end
end
