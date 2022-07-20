defmodule MACROS.UnlessTest do
  use ExUnit.Case
  require MACROS.Unless
  import ExUnit.CaptureIO

  test "Unless returns nil when condition is true" do
    to_print = "this will be printed because
                the arguments to a function call are evaluated
                before calling the function"
    assert MACROS.Unless.fun_unless(true, do: IO.puts(to_print)) == nil
    assert capture_io(fn -> MACROS.Unless.fun_unless(true, do: IO.puts(to_print)) end) ==
             "#{to_print}\n"

    assert MACROS.Unless.macro_unless(true, do: IO.puts("this should never be printed")) == nil
  end

  test "Unless executes expression when condition is false" do
    assert MACROS.Unless.fun_unless(false, do: IO.puts("this should be printed")) == :ok
    assert MACROS.Unless.macro_unless(false, do: IO.puts("this should be printed")) == :ok
  end
end
