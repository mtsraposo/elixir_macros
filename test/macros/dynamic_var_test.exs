defmodule MACROS.DynamicVarTest do
  use ExUnit.Case
  require MACROS.DynamicVar

  test "initialize input array to char count" do
    MACROS.DynamicVar.initialize_to_char_count([:red, :green, :yellow])
    assert [red, green, yellow] == [3, 5, 6]
  end
end