defmodule TestSundaysOnFirstStreams do
  use ExUnit.Case

  @module SundaysOnFirstStreams

  test "From 1901 to 2000" do
    {from, to, jan1, expected} = {1901, 2000, 2, 171}
    real = @module.count_sundays_on_first_of_month(from, to, jan1)
    assert real == expected
  end
end
