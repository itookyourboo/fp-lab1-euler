defmodule SundaysOnFirstTailRecursion do
  defp is_leap_year(year) when rem(year, 400) == 0, do: true
  defp is_leap_year(year) when rem(year, 100) == 0, do: false
  defp is_leap_year(year) when rem(year, 4) == 0, do: true
  defp is_leap_year(_), do: false

  defp days_in_month(2, year) do
    if is_leap_year(year), do: 29, else: 28
  end

  defp days_in_month(month, _)
       when month in [4, 6, 9, 11],
       do: 30

  defp days_in_month(_, _), do: 31

  defp count_sundays_on_first_of_month(start_year, end_year, _month, _day, count)
       when start_year > end_year,
       do: count

  defp count_sundays_on_first_of_month(start_year, end_year, month, day, count) do
    year = start_year
    next_day = rem(day + days_in_month(month, year), 7)
    next_year = if month == 12, do: year + 1, else: year
    next_month = if month == 12, do: 1, else: month + 1

    count_sundays_on_first_of_month(
      next_year,
      end_year,
      next_month,
      next_day,
      count + if(day == 0, do: 1, else: 0)
    )
  end

  def count_sundays_on_first_of_month(start_year, end_year, jan1) do
    count_sundays_on_first_of_month(start_year, end_year, 1, jan1, 0)
  end
end
