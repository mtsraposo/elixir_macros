defmodule MACROS.TestCase do
  defmacro __using__(_opts) do
    quote do
      import MACROS.TestCase
    end
  end

  defmacro test(description, do: block) do
    function_name = String.to_atom("test " <> description)
    quote do
      def unquote(function_name)(), do: unquote(block)
    end
  end
end