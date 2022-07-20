defmodule MACROS.TestCaseTest do
  use MACROS.TestCase

  test "hello" do
    "hello" = "hello"
  end

  test "arithmetic" do
    3 = 1 + 2
  end
end

MACROS.TestCaseTest.run()