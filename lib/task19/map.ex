defmodule CountSundaysOnFirst do
  @days_in_month [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

  defp is_leap_year(year) when rem(year, 400) == 0, do: true
  defp is_leap_year(year) when rem(year, 100) == 0, do: false
  defp is_leap_year(year) when rem(year, 4) == 0, do: true
  defp is_leap_year(_), do: false

  defp days_in_month(2, year) do
    cond do
      is_leap_year(year)  -> 29
      true                -> 28
    end
  end
  defp days_in_month(2, _), do: 28
  defp days_in_month(month, _), do: Enum.at(@days_in_month, month - 1)

  def count_sundays_on_first_of_month do
    start_year = 1901
    end_year = 2000
    {current_day, count} = {2, 0}  # 1 Jan 1901 was a Tuesday

    Enum.reduce(start_year..end_year, count, fn year, acc ->
      Enum.reduce(1..12, {current_day, acc}, fn month, {day, count_acc} ->
        new_day = rem(day + days_in_month(month, year), 7)
        new_count_acc = if new_day == 0, do: count_acc + 1, else: count_acc
        {new_day, new_count_acc}
      end)
    end)
  end
end

IO.puts(CountSundaysOnFirst.count_sundays_on_first_of_month())