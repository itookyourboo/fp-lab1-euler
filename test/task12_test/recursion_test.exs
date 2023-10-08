defmodule TestTriangleNumber_Recursion do
  use ExUnit.Case

  @module TriangleNumber_Recursion

  test "5 divisors" do
    arg = 5; expected = 28
    real = @module.find_triangle_with_divisors(arg)
    assert real == expected
  end

  test "10 divisors" do
    arg = 10; expected = 120
    real = @module.find_triangle_with_divisors(arg)
    assert real == expected
  end

  test "50 divisors" do
    arg = 50; expected = 25200
    real = @module.find_triangle_with_divisors(arg)
    assert real == expected
  end

  test "100 divisors" do
    arg = 100; expected = 73920
    real = @module.find_triangle_with_divisors(arg)
    assert real == expected
  end

  test "200 divisors" do
    arg = 200; expected = 2031120
    real = @module.find_triangle_with_divisors(arg)
    assert real == expected
  end

  test "500 divisors" do
    arg = 500; expected = 76576500
    real = @module.find_triangle_with_divisors(arg)
    assert real == expected
  end
end
