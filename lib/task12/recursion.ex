defmodule TriangleNumberRecursion do
  defp _count_divisors(n, divisor) when divisor * divisor > n do
    1
  end
  defp _count_divisors(n, divisor) when rem(n, divisor) != 0 do
    _count_divisors(n, divisor + 1)
  end
  defp _count_divisors(n, divisor) when divisor * divisor == n do
    1 + _count_divisors(n, divisor + 1)
  end
  defp _count_divisors(n, divisor) do
    2 + _count_divisors(n, divisor + 1)
  end
  def count_divisors(n) do
    _count_divisors(n, 1)
  end

  def find_triangle_with_divisors(divisor_count, n \\ 1, sum \\ 0) do
    if count_divisors(sum) > divisor_count do
      sum
    else
      find_triangle_with_divisors(divisor_count, n + 1, sum + n)
    end
  end
end
