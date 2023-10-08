defmodule SundaysOnFirst_Modules do
  defp is_leap_year(year) when rem(year, 400) == 0, do: true
  defp is_leap_year(year) when rem(year, 100) == 0, do: false
  defp is_leap_year(year) when rem(year, 4) == 0, do: true
  defp is_leap_year(_), do: false

  defp days_in_month(2, year) do
    if is_leap_year(year) do
      29
    else
      28
    end
  end
  defp days_in_month(month, _)
      when month in [4, 6, 9, 11], do: 30
  defp days_in_month(_, _), do: 31

  defp first_sundays(year, day) do
    for month <- 1..12, rem(day + days_in_month(month, year), 7) == 0, do: 1
  end

  def count_sundays_on_first_of_month(start_year, end_year) do
    1..(end_year - start_year + 1)
    |> Enum.reduce(0, fn year, acc ->
      first_sundays(year, acc)
    end)
  end
end
