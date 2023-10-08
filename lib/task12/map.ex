defmodule TriangleNumber_Map do
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

  defp triangles do
    {0, 1}
    |> Stream.iterate(fn {cur, n} -> {cur + n, n + 1} end)
    |> Stream.map(fn {triangle, _} -> triangle end)
  end

  def find_triangle_with_divisors(divisor_count) do
    triangles()
    |> Stream.map(fn triangle -> {triangle, count_divisors(triangle)} end)
    |> Stream.filter(fn {_triangle, divisors} -> divisors > divisor_count end)
    |> Enum.take(1)
    |> Enum.at(0)
    |> elem(0)
  end
end
