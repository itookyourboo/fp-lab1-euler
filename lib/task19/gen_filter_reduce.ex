defmodule SundaysOnFirstGFR do
  defp is_leap_year(year) when rem(year, 400) == 0, do: true
  defp is_leap_year(year) when rem(year, 100) == 0, do: false
  defp is_leap_year(year) when rem(year, 4) == 0, do: true
  defp is_leap_year(_), do: false

  defp days_in_month(2, year) do
    if is_leap_year(year), do: 29, else: 28
  end
  defp days_in_month(month, _)
      when month in [4, 6, 9, 11], do: 30
  defp days_in_month(_, _), do: 31

  defp iter_weekday(w), do: rem(w + 1, 7)
  defp iter_day(d, m, y) do
    if d == days_in_month(m, y), do: 1, else: d + 1
  end

  defp iter_month(d, m, y) do
    if iter_day(d, m, y) == 1 do
      if m == 12, do: 1, else: m + 1
    else
      m
    end
  end

  defp iter_year(d, m, y) do
    if m == 12 && iter_day(d, m, y) == 1, do: y + 1, else: y
  end

  defp gen_days(start_year, month, day, weekday) do
    Stream.iterate({start_year, month, day, weekday}, fn {y, m, d, w} ->
      {iter_year(d, m, y), iter_month(d, m, y), iter_day(d, m, y), iter_weekday(w)}
    end)
  end

  defp filter_years(seq, end_year) do
    Enum.take_while(
      seq,
      fn {year, _, _, _} -> year <= end_year
    end)
  end

  defp filter_days(seq) do
    Enum.filter(seq,
      fn {_, _, day, weekday} -> day == 1 && weekday == 0
    end)
  end

  defp count(seq) do
    Enum.count(seq)
  end

  def count_sundays_on_first_of_month(start_year, end_year, jan1) do
    gen_days(start_year, 1, 1, jan1)
    |> filter_years(end_year)
    |> filter_days
    |> count
  end
end
