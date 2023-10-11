defmodule TriangleNumberTailRecursion do
  defp _count_divisors(n, divisor, count) when divisor * divisor > n do
    count
  end

  defp _count_divisors(n, divisor, count) when rem(n, divisor) != 0 do
    _count_divisors(n, divisor + 1, count)
  end

  defp _count_divisors(n, divisor, count) when div(n, divisor) == divisor do
    _count_divisors(n, divisor + 1, count + 1)
  end

  defp _count_divisors(n, divisor, count) do
    _count_divisors(n, divisor + 1, count + 2)
  end

  def count_divisors(n) do
    _count_divisors(n, 1, 0)
  end

  def find_triangle_with_divisors(divisor_count, n \\ 1, sum \\ 0) do
    if count_divisors(sum) > divisor_count do
      sum
    else
      find_triangle_with_divisors(divisor_count, n + 1, sum + n)
    end
  end
end
