defmodule TriangleNumber_GFR do
  defp divisors(1), do: [1]
  defp divisors(n), do: [1, n | divisors(2, n, n)]
  defp divisors(k, _n, q) when k * k > q, do: []
  defp divisors(k, n, q) when rem(n, k) != 0 do
    divisors(k + 1, n, q)
  end
  defp divisors(k, n, q) when k * k == n do
    [k | divisors(k + 1, n, q)]
  end
  defp divisors(k, n, q) do
    [k, div(n, k) | divisors(k + 1, n, q)]
  end

  defp count_divisors(n) do
    n
    |> divisors
    |> Enum.count
  end

  defp triangle_number(n) do
    Enum.reduce(1..n, 0, fn x, acc -> x + acc end)
  end

  def find_triangle_with_divisors(divisor_count, n \\ 1) do
    if count_divisors(triangle_number(n)) > divisor_count do
      triangle_number(n)
    else
      find_triangle_with_divisors(divisor_count, n + 1)
    end
  end
end
