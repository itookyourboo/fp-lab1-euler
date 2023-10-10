defmodule TestTriangleNumberRecursion do
  use ExUnit.Case

  @module TriangleNumberRecursion

  test "5 divisors" do
    {arg, expected} = {5, 28}
    real = @module.find_triangle_with_divisors(arg)
    assert real == expected
  end

  test "10 divisors" do
    {arg, expected} = {10, 120}
    real = @module.find_triangle_with_divisors(arg)
    assert real == expected
  end

  test "50 divisors" do
    {arg, expected} = {50, 25_200}
    real = @module.find_triangle_with_divisors(arg)
    assert real == expected
  end

  test "100 divisors" do
    {arg, expected} = {100, 73_920}
    real = @module.find_triangle_with_divisors(arg)
    assert real == expected
  end

  test "200 divisors" do
    {arg, expected} = {200, 2_031_120}
    real = @module.find_triangle_with_divisors(arg)
    assert real == expected
  end

  test "500 divisors" do
    {arg, expected} = {500, 76_576_500}
    real = @module.find_triangle_with_divisors(arg)
    assert real == expected
  end
end
