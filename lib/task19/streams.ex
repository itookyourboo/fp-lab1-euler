defmodule SundaysOnFirstStreams do
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

  def count_sundays_on_first_of_month(start_year, end_year, jan1) do
    Stream.iterate({start_year, 1, jan1}, fn {year, month, day} ->
      next_day = rem(day + days_in_month(month, year), 7)
      next_month = if month == 12, do: 1, else: month + 1
      next_year = if month == 12, do: year + 1, else: year
      {next_year, next_month, next_day}
    end)
    |> Stream.take_while(fn {year, _, _} -> year <= end_year end)
    |> Stream.filter(fn {_, _, day} -> day == 0 end)
    |> Enum.count()
  end
end
