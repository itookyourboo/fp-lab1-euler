defmodule TestSundaysOnFirst_TailRecursion do
  use ExUnit.Case

  @module SundaysOnFirst_TailRecursion

  test "1901 2000 divisors" do
    from = 1901; to = 2000; expected = 28
    real = @module.count_sundays_on_first_of_month(from, to)
    assert real == expected
  end
end
