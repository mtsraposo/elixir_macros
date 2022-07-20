defmodule MACROSTest do
  use ExUnit.Case
  doctest MACROS

  test "greets the world" do
    assert MACROS.hello() == :world
  end
end
