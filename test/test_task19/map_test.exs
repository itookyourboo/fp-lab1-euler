defmodule TestSundaysOnFirst_Map do
  use ExUnit.Case

  @module SundaysOnFirst_Map

  test "1901 2000 divisors" do
    from = 1901; to = 2000; expected = 28
    real = @module.count_sundays_on_first_of_month(from, to)
    assert real == expected
  end
end
